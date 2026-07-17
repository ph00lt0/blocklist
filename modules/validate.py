# Description: This file contains functions to validate all types of records.


import re
import string

import validators
import whois
import dns.resolver


# This function is used to check if a domain is registered or not
def is_registered(domain_name):  
    answers = []
    try:
        answers.append(dns.resolver.resolve(domain_name, 'A'))
        answers.append(dns.resolver.resolve(domain_name, 'AAAA'))
        answers.append(dns.resolver.resolve(domain_name, 'CNAME'))
        answers.append(dns.resolver.resolve(domain_name, 'NS'))
        answers.append(dns.resolver.resolve(domain_name, 'SOA'))
    except:
        pass
   
    if len(answers) > 0:
        return True
    else:
        try:
            w = whois.whois(domain_name)
            # if the domain is not registered, the whois lookup will return an empty string and the bool() function will return False
            return bool(w.domain_name)
        except Exception:
            # if lookup fails return True to avoid removing the domain, as it could be a valid domain and lookup may fail due to network restrictions
            print('Domain lookup failed:', domain_name)
            return True


# This function is used to check if a record is a domain or IP record.
def is_domain_or_ip_record(record):
    if record.startswith('||'):
        domain_match = re.search(r'\|\|(.+?)\^', record)
        if domain_match:
            domain_record = domain_match.group(1)
            domain = domain_record.split('/')[0]
            if not is_domain_or_ip(domain):
                print('Invalid record #5:', record)
                return False
            return True
    return False


# This function is used to check if a string is a domain or IP.
def is_domain_or_ip(domainorip):
    if validators.ipv4(domainorip) or validators.ipv6(domainorip):
        return True
    else:
        return is_domain(domainorip)


# This function is used to check if a string is a domain.
def is_domain(domain):
    if '*' in domain and not '*$' in domain:
        # print('Wildcard entity domain:', domain)
        return True

    if not validators.domain(domain):
        # print('Invalid domain:', domain)
        return False
    
    # TODO not working as expected, need to find a better way to validate domains, whois lookup is not reliable, certain offensive countries domains are not being validated
    # if not is_registered(domain):
    #     print('Domain not registered:', domain)
    #     return False
    
    # print('Valid domain:', domain)
    return True


# This function is used to validate a single record.
def validate_record(record):
    is_legit = False

    # Allowlist items follow same syntax but start with @@. Remove the @@ prefix if present for validation.
    if record.startswith('@@'):
        record = record[2:]

    if is_domain_or_ip_record(record):
        is_legit = True
    
    # If no domain is found, the record is still valid other validations will be done in the next steps
    
    global_filename_match = re.search(r'\^([^|^]+)\^', record)
    if global_filename_match:
        filename = global_filename_match.group(1)
        if not filename:
            print('Invalid record #1:', record)
            return False
        # print('Valid global filename:', filename)
        is_legit = True

    # Prevent double entry chars
    if '^^' in record or '$$' in record or '**' in record or '//' in record or '..' in record  or '::' in record or '++' in record:
        print('Invalid record #11:', record)
        return False

    remove_param_match = re.search(r'\$removeparam=([a-zA-Z-_]+)', record)
    if remove_param_match:
        remove_param = remove_param_match.group(1)
        if not remove_param:
            print('Invalid record #2:', record)
            return False
        # If the record is a global record, the remove parameter is valid, if not, check if the domain parameter is valid
        if not record.startswith('||') and record.startswith('*$removeparam='):
            # print('Valid global remove parameter:', remove_param)
            is_legit = True

        else:
            domain_param_match = re.search(r'\|\|(.+?)\^\$removeparam=([a-zA-Z-_]+)', record)
            if domain_param_match:
                domain = domain_param_match.group(1)
                remove_param = domain_param_match.group(2)
                if not is_domain(domain):
                    print('Invalid record #10:', record)
                    return False
                if not remove_param:
                    print('Invalid record #3:', record)
                    return False
                
                # print('Valid domain remove parameter:', remove_param)
                is_legit = True
    
    # Class and ID filter
    if not record.startswith('||') \
        and ('##.' in record or '###' in record)\
          and record.endswith(tuple(string.ascii_letters + string.digits)):
        is_legit = True

    # Data attribute filter
    if not record.startswith('||') and '##[' in record and record.endswith(']'):
        is_legit = True

    # Element filters
    # Could be more refined with required params etc
    js_options = [
        'rc',
        'cookie-remover',
        'aopr',
        'acis',
        'aopw',
        'aost',
        'aeld',
        'trusted-click-element',
        'set',
        'trusted-set',
        'trusted-set-constant',
        'trusted-suppress-native-method',
        'set-cookie',
        'remove-cookie',
        'set-local-storage-item',
        'set-session-storage-item',
        'trusted-set-local-storage-item',
        'trusted-set-session-storage-item',
        'remove-cache-storage-item',
        'call-nothrow',
        'nosiif',
        'nostif',
        'nano-sib',
        'nano-stb',
        'no-xhr-if',
        'no-fetch-if',
        'trusted-replace-xhr-response',
        'trusted-replace-fetch-response',
        'trusted-replace-argument',
        'set-attr',
        'ra',
        'rmnt',
        'trusted-rpnt',
        'trusted-rpot',
        'spoof-css',
        'prevent-canvas',
        'href-sanitizer',
        'disable-newtab-links',
        'window-close-if',
        'nowoif',
        'object-prune',
        'trusted-prune-inbound-object',
        'trusted-prune-outbound-object',
        'json-prune',
        'json-prune-fetch-response',
        'json-prune-xhr-response',
        'evaldata-prune',
        'xml-prune',
        'm3u-prune',
        'noeval',
        'noeval-silent',
        'noeval-if',
        'no-floc',
        'norafif',
        'nowebrtc',
        'webrtc-if',
        'window.name-defuser',
        'refresh-defuser',
        'overlay-buster',
        'alert-buster'
    ]

    cosmetic_options = [
        'has',
        'matches-prop',
        'has-text',
        'matches-attr',
        'matches-css',
        'matches-css-before',
        'matches-css-after',
        'matches-media',
        'matches-path',
        'matches-prop',
        'min-text-length',
        'not',
        'others',
        'upward',
        'watch-attr',
        'xpath'
    ]

    action_options = [
        'remove',
        'style',
        'remove-attr',
        'remove-class',
    ]

    filter_options = [
        'badfilter',
        'first-party',
        'third-party',
        'subdocument',
        'denyallow',
        'all',
        'cname'
        'document',
        'domain',
        'elemhide',
        'font',
        'frame',
        'generichide',
        'header',
        'image',
        'important',
        'inline-script',
        'inline-font',
        'match-case',
        'media',
        'method',
        'object',
        'other',
        'permissions',
        'ping',
        'popunder',
        'popup',
        'script',
        'specifichide',
        'hide',
        'shide',
        'strict1p',
        'strict3p',
        'to',
        'websocket',
        'xhr',
        'xmlhttprequest',
        'csp',
        'empty',
        'mp4',
        'redirect',
        'redirect-rule',
        'removeparam',
        'replace',
        'uritransform',
    ]

    if not record.startswith('||') and ('##' in record):
        if '+js(' in record and record.endswith(')'):
            if not any(option in record for option in js_options):
                print('Invalid record #9:', record)
                return False
            is_legit = True
        elif(':' in record and record.endswith(')')):
            if not any(option in record for option in cosmetic_options) and not any(option in record for option in action_options):
                print('Invalid record #8:', record)
                return False
            is_legit = True
        elif(record.endswith(tuple(string.ascii_letters))): 
            is_legit = True


    if '$' in record:
        if not '^$' in record and not record.startswith('*$'):
            print('Invalid record #6:', record)
            return False
        if not any(option in record for option in filter_options):
            print('Invalid record #7:', record)
            return False
        is_legit = True

    if not is_legit:
        print('Record not legit #4:', record)
        return False
    return True
