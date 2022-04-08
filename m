Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4B4F9D30
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 20:48:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 73CBF204D1; Fri,  8 Apr 2022 18:48:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  8 18:48:46 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 52CC92041A
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Apr 2022 18:48:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DLCcfX_PR_zC for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Apr 2022 18:48:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ej1-x62f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DD6892041C
	for <nbd@other.debian.org>; Fri,  8 Apr 2022 18:48:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id l7so13629920ejn.2
        for <nbd@other.debian.org>; Fri, 08 Apr 2022 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=nnxKU/leQ6JQuKVSwX/T+Ey66evWHoxVm7gg/+vopO0=;
        b=QZHe6RINWTFG7LqiFKH13CvKBUzm2OHUOQjYhWg9R5oQZT5XkV3Jo97XpmplGsT6LH
         Lh4bWHYsK79BTHLaB/qahXMNeK1artfr8wXXtwvpSr+fyWFJKzlkAL/tEYcVK/0Sl6Yp
         rcpKxOf4/0KfJB5IO2YkQCmXyrK8WfCYppxGmxu8t00gNsLYIMzS4wlXSi90i0rFVxUY
         zg86eQi6fyQ8huPe3IruF0LtQzKEWmgZtx/2b6M3ZbPA0p2DMwFkzUqI7zWADr49ZoZQ
         lZ6CJ2MWpznJcV5RB2MQzvjxGqanzgMW0oI8pujUn3rghIHV2bBfs282pBGuVEUC1Esv
         sX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=nnxKU/leQ6JQuKVSwX/T+Ey66evWHoxVm7gg/+vopO0=;
        b=DIMIIEq8ap20o9pb348SZAJgpPNPBn6iyf9Td07QmMF88N0lt0PX7Bi20JmMwmwm/S
         cgG0e4ZDfXCdbMI2Cu0m9BBEe7rb4VXuUFLRHBFOfqWgfCMxcG4LRqiUCayLDldYIZkC
         /kXmYYF11hARODLKJjDI/imMeFG5HiPyDoTiTSAOTM9/eLSkffa9eUTJBLzpQPDtWxs1
         No8K+6IneEUYppPl/lMI475PBGK8tOd3QV6fwByCwryMnwyRR31+FcBowgwitoIdWZ67
         /+At6vjkxgIzR3wzig7x0D1GYtnn+UnQeT9YiwfL5/ZQX8qp58g4Uw9+DG1RU33KaDOu
         iiLg==
X-Gm-Message-State: AOAM531idXqeYvzVv5uC/KCaaHgwwAtYFbavlnnlVo3N3EPsZJHJBK8t
	UqGTnAKyeUXEt2GX8egyi2XTIsPJ1ugCIg==
X-Google-Smtp-Source: ABdhPJyCE2icUP+71hQzQGxDelZVBCxnlKbbEhtb0n3JH6bN8VvQBQX6EVRSHO+OJYJJ5ykX3Q3JjQ==
X-Received: by 2002:a17:906:fa8f:b0:6e4:de0d:45f with SMTP id lt15-20020a170906fa8f00b006e4de0d045fmr2301687ejb.235.1649443708564;
        Fri, 08 Apr 2022 11:48:28 -0700 (PDT)
Received: from ?IPV6:2003:d9:9707:a400:4c2e:2e69:5fb7:98fd? (p200300d99707a4004c2e2e695fb798fd.dip0.t-ipconnect.de. [2003:d9:9707:a400:4c2e:2e69:5fb7:98fd])
        by smtp.googlemail.com with ESMTPSA id kb28-20020a1709070f9c00b006d5d8bf1b72sm8832537ejc.78.2022.04.08.11.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 11:48:27 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------jPelIMjV78UnXllz7uT5r9lf"
Message-ID: <7ace6076-57cd-a0b0-3d2d-30815c7b4997@colorfullife.com>
Date: Fri, 8 Apr 2022 20:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] nbd-trdump, nbd-trplay: printf
 improvements/corrections
Content-Language: en-US
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, Manfred Spraul <manfred.spraul@de.bosch.com>
References: <20220319121227.39165-1-manfred@colorfullife.com>
 <20220319121227.39165-3-manfred@colorfullife.com>
 <YjysHBc/slP7b34M@pc181009.grep.be>
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <YjysHBc/slP7b34M@pc181009.grep.be>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <O86Fj_HMUpO.A.bSC.OOIUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1933
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7ace6076-57cd-a0b0-3d2d-30815c7b4997@colorfullife.com
Resent-Date: Fri,  8 Apr 2022 18:48:46 +0000 (UTC)

This is a multi-part message in MIME format.
--------------jPelIMjV78UnXllz7uT5r9lf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Wouter,

Sorry for the slow reply:
I have overlooked your mail, and only today noticed it.

On 3/24/22 18:36, Wouter Verhelst wrote:
> On Sat, Mar 19, 2022 at 01:12:26PM +0100, Manfred Spraul wrote:
>> From: Manfred Spraul <manfred.spraul@de.bosch.com>
>>
>> Two improvements to the printf output:
>> - Correct an incorrect printout from nbd-trplay:
>>    When open() on the the log file fails, the tool incorrectly warns
>>    that the disk image is inaccessible.
>>
>> - Both nbd-trdump and nbd-trplay: Add a warning if unknown options
>>    are encountered.
>>
>> Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
>> ---
>>   nbd-trdump.c | 4 ++++
>>   nbd-trplay.c | 4 +++-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/nbd-trdump.c b/nbd-trdump.c
>> index d914e63..c7c5322 100644
>> --- a/nbd-trdump.c
>> +++ b/nbd-trdump.c
>> @@ -130,14 +130,18 @@ int main(int argc, char**argv) {
>>   					break;
>>   				default:
>>   					printf("TRACE_OPTION ? Unknown type\n");
>> +					printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
>> +
Ups - an unnecessary empty line. I've removed that as well.
>>   				}
>>   			} else {
>>   				printf("TRACE_OPTION ? Unknown FROM_MAGIC\n");
>> +				printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
>>   			}
>>   			break;
>>   
>>   		default:
>>   			printf("? Unknown transaction type %08x\n",magic);
>> +			printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
>>   			break;
>>   		}
>>   		
>> diff --git a/nbd-trplay.c b/nbd-trplay.c
>> index 143d8cb..f98b7df 100644
>> --- a/nbd-trplay.c
>> +++ b/nbd-trplay.c
>> @@ -221,9 +221,11 @@ int main_loop(int logfd, int imagefd) {
>>   					break;
>>   				default:
>>   					printf("TRACE_OPTION ? Unknown type\n");
>> +					printf(" Further log file evaluation may be incorrect, please upgrade nbd-trplay.\n");
>>   				}
>>   			} else {
>>   				printf("TRACE_OPTION ? Unknown FROM_MAGIC\n");
>> +				printf(" Further log file evaluation may be incorrect, please upgrade nbd-trplay.\n");
>>   			}
>>   			break;
>>   
>> @@ -301,7 +303,7 @@ int main(int argc, char **argv) {
>>   		case 'l':
>>   			logfd = open(optarg, O_RDONLY, 0);
>>   			if (logfd == -1) {
>> -				printf("  Opening disk image failed, errno %d.", errno);
>> +				printf("  Opening log file failed, errno %d.", errno);
> Please use perror() for these instead.

Updated patch is attached.

Should I resend the whole series?

--

     Manfred

--------------jPelIMjV78UnXllz7uT5r9lf
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-nbd-trdump-nbd-trplay-printf-improvements-correction.patch"
Content-Disposition: attachment;
 filename*0="0002-nbd-trdump-nbd-trplay-printf-improvements-correction.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA4YWY3OTIwYjg2ZjdhYTRkZGUxOGZmNDZjZmFkNjFjNWNjMzkzM2M1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYW5mcmVkIFNwcmF1bCA8bWFuZnJlZC5zcHJhdWxA
ZGUuYm9zY2guY29tPgpEYXRlOiBNb24sIDcgTWFyIDIwMjIgMTg6MDU6NDUgKzAxMDAKU3Vi
amVjdDogW1BBVENIIDIvM10gbmJkLXRyZHVtcCwgbmJkLXRycGxheTogcHJpbnRmIGltcHJv
dmVtZW50cy9jb3JyZWN0aW9ucwoKVHdvIGltcHJvdmVtZW50cyB0byB0aGUgcHJpbnRmIG91
dHB1dDoKLSBDb3JyZWN0IGFuIGluY29ycmVjdCBwcmludG91dCBmcm9tIG5iZC10cnBsYXk6
CiAgV2hlbiBvcGVuKCkgb24gdGhlIHRoZSBsb2cgZmlsZSBmYWlscywgdGhlIHRvb2wgaW5j
b3JyZWN0bHkgd2FybnMKICB0aGF0IHRoZSBkaXNrIGltYWdlIGlzIGluYWNjZXNzaWJsZS4K
Ci0gc3dpdGNoIGZvciB0aGUgZmlsZSBvcGVuIGZhaWx1cmVzIGluIG5iZC10cnBsYXkgZnJv
bSBwcmludGYoKSB0bwogIHBlcnJvcigpLgoKLSBCb3RoIG5iZC10cmR1bXAgYW5kIG5iZC10
cnBsYXk6IEFkZCBhIHdhcm5pbmcgaWYgdW5rbm93biBvcHRpb25zCiAgYXJlIGVuY291bnRl
cmVkLgoKU2lnbmVkLW9mZi1ieTogTWFuZnJlZCBTcHJhdWwgPG1hbmZyZWQuc3ByYXVsQGRl
LmJvc2NoLmNvbT4KCi0tLQpWMjogc3dpdGNoIHRvIHBlcnJvcigpIGFkZGVkLgotLS0KIG5i
ZC10cmR1bXAuYyB8IDQgKysrKwogbmJkLXRycGxheS5jIHwgNiArKysrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L25iZC10cmR1bXAuYyBiL25iZC10cmR1bXAuYwppbmRleCBkOTE0ZTYzLi5jN2M1MzIyIDEw
MDY0NAotLS0gYS9uYmQtdHJkdW1wLmMKKysrIGIvbmJkLXRyZHVtcC5jCkBAIC0xMzAsMTQg
KzEzMCwxNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhcioqYXJndikgewogCQkJCQlicmVh
azsKIAkJCQlkZWZhdWx0OgogCQkJCQlwcmludGYoIlRSQUNFX09QVElPTiA/IFVua25vd24g
dHlwZVxuIik7CisJCQkJCXByaW50ZigiIEZ1cnRoZXIgbG9nIGZpbGUgZXZhbHVhdGlvbiBt
YXkgYmUgaW5jb3JyZWN0LCBwbGVhc2UgdXBncmFkZSBuYmQtdHJkdW1wLlxuIik7CiAJCQkJ
fQogCQkJfSBlbHNlIHsKIAkJCQlwcmludGYoIlRSQUNFX09QVElPTiA/IFVua25vd24gRlJP
TV9NQUdJQ1xuIik7CisJCQkJcHJpbnRmKCIgRnVydGhlciBsb2cgZmlsZSBldmFsdWF0aW9u
IG1heSBiZSBpbmNvcnJlY3QsIHBsZWFzZSB1cGdyYWRlIG5iZC10cmR1bXAuXG4iKTsKIAkJ
CX0KIAkJCWJyZWFrOwogCiAJCWRlZmF1bHQ6CiAJCQlwcmludGYoIj8gVW5rbm93biB0cmFu
c2FjdGlvbiB0eXBlICUwOHhcbiIsbWFnaWMpOworCQkJcHJpbnRmKCIgRnVydGhlciBsb2cg
ZmlsZSBldmFsdWF0aW9uIG1heSBiZSBpbmNvcnJlY3QsIHBsZWFzZSB1cGdyYWRlIG5iZC10
cmR1bXAuXG4iKTsKIAkJCWJyZWFrOwogCQl9CiAJCQpkaWZmIC0tZ2l0IGEvbmJkLXRycGxh
eS5jIGIvbmJkLXRycGxheS5jCmluZGV4IDE0M2Q4Y2IuLjdmMzBjYmMgMTAwNjQ0Ci0tLSBh
L25iZC10cnBsYXkuYworKysgYi9uYmQtdHJwbGF5LmMKQEAgLTIyMSw5ICsyMjEsMTEgQEAg
aW50IG1haW5fbG9vcChpbnQgbG9nZmQsIGludCBpbWFnZWZkKSB7CiAJCQkJCWJyZWFrOwog
CQkJCWRlZmF1bHQ6CiAJCQkJCXByaW50ZigiVFJBQ0VfT1BUSU9OID8gVW5rbm93biB0eXBl
XG4iKTsKKwkJCQkJcHJpbnRmKCIgRnVydGhlciBsb2cgZmlsZSBldmFsdWF0aW9uIG1heSBi
ZSBpbmNvcnJlY3QsIHBsZWFzZSB1cGdyYWRlIG5iZC10cnBsYXkuXG4iKTsKIAkJCQl9CiAJ
CQl9IGVsc2UgewogCQkJCXByaW50ZigiVFJBQ0VfT1BUSU9OID8gVW5rbm93biBGUk9NX01B
R0lDXG4iKTsKKwkJCQlwcmludGYoIiBGdXJ0aGVyIGxvZyBmaWxlIGV2YWx1YXRpb24gbWF5
IGJlIGluY29ycmVjdCwgcGxlYXNlIHVwZ3JhZGUgbmJkLXRycGxheS5cbiIpOwogCQkJfQog
CQkJYnJlYWs7CiAKQEAgLTI5NCwxNCArMjk2LDE0IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICoqYXJndikgewogCQljYXNlICdpJzoKIAkJCWltYWdlZmQgPSBvcGVuKG9wdGFyZywg
T19SRFdSLCAwKTsKIAkJCWlmIChpbWFnZWZkID09IC0xKSB7Ci0JCQkJcHJpbnRmKCIgIE9w
ZW5pbmcgZGlzayBpbWFnZSBmYWlsZWQsIGVycm5vICVkLiIsIGVycm5vKTsKKwkJCQlwZXJy
b3IoIiAgT3BlbmluZyBkaXNrIGltYWdlIGZhaWxlZCIpOwogCQkJCXJldHVybiAxOwogCQkJ
fQogCQkJYnJlYWs7CiAJCWNhc2UgJ2wnOgogCQkJbG9nZmQgPSBvcGVuKG9wdGFyZywgT19S
RE9OTFksIDApOwogCQkJaWYgKGxvZ2ZkID09IC0xKSB7Ci0JCQkJcHJpbnRmKCIgIE9wZW5p
bmcgZGlzayBpbWFnZSBmYWlsZWQsIGVycm5vICVkLiIsIGVycm5vKTsKKwkJCQlwZXJyb3Io
IiAgT3BlbmluZyBsb2cgZmlsZSBmYWlsZWQiKTsKIAkJCQlyZXR1cm4gMTsKIAkJCX0KIAkJ
CWJyZWFrOwotLSAKMi4zNS4xCgo=

--------------jPelIMjV78UnXllz7uT5r9lf--

