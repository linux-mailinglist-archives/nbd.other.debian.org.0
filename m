Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E94CC552
	for <lists+nbd@lfdr.de>; Thu,  3 Mar 2022 19:38:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EF671204B4; Thu,  3 Mar 2022 18:38:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  3 18:38:23 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 695B22048C
	for <lists-other-nbd@bendel.debian.org>; Thu,  3 Mar 2022 18:38:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Mu6neuVlcd9K for <lists-other-nbd@bendel.debian.org>;
	Thu,  3 Mar 2022 18:38:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ej1-x635.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B57FA2048E
	for <nbd@other.debian.org>; Thu,  3 Mar 2022 18:38:06 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gb39so12582467ejc.1
        for <nbd@other.debian.org>; Thu, 03 Mar 2022 10:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oOuo6U0XfTlOeggM3psv+2WVB3eJzy8J5B+64PC2+dI=;
        b=MjHnzQY/Pwz08lORYseF+Zl4hR1rhxj6HKUKKAsI/ulIUP//FviqyZ1dkwSF/gmP5a
         bdzNhd6ZjlqN6QTauSTKIuzlL7oQSqgiFF7YII4oWx61fpOHfUiwj40uUmr/pvUoDRp7
         c68wzdsc2WdGg4FtSagrYIOMkPEgMmV9d5u0T25xUy5cc8jB9SwLgbjCofmo0uRT+/es
         e7e4AIpUg6TANmnl4Nq1rTnqGMPTAEnRkvkQW4LCt79u2XtnzRRDFe3AXfIfz5hmYg9p
         lboljvYdFH5CcsLeIzgCcD78umP9DPqmoeA019POKJ7Ik5FX2inqhfFyAA9+AzoCN/De
         MloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oOuo6U0XfTlOeggM3psv+2WVB3eJzy8J5B+64PC2+dI=;
        b=0WevQpJW2wI2JB/0nr0wHnm706TfKck09xT2/c03SJ0uTSwIDjsNEG7/xb0m3a9mpy
         bD7V/a6LWCqgoNrwq8u8wqEz1IYuMXpD1WhQvGDD0U/WyBiix+O9UNCcLHQEDA6GGojV
         lHTgjHNU+1WMIWXmHh/LRKs9t0gJLdK8mYPQGS397mo7/lBNBZ/x3P1in1eGXp9fCvYD
         Cr8J9pAuj+9i4/aA0t+Uc+g31PLUZ6OzXOrlcLdQ1IR3vhT5Pfiu7n7xCOOe5s7gPgTL
         w4FIoPkD7j/SunyB2FPhpO+MdSWwZYXNvHcl1KQZv0+CRV5yVIW67rya7aEJ9fB6qlo6
         W55A==
X-Gm-Message-State: AOAM53321T8ChV0INg5M6ViPHpf8dtDAeQvi2+w1UI4W7n2eZBVgtuE+
	kr1OjX6NqAnFViUxhXlmaB5iAA==
X-Google-Smtp-Source: ABdhPJzv9/stzCWurG8AebBGRDfILpCwGEqneKzGBNc/h2pABuOdblrYtyFx4NokAVkGTC3I3fSoaQ==
X-Received: by 2002:a17:907:1c13:b0:6da:62bb:f1ff with SMTP id nc19-20020a1709071c1300b006da62bbf1ffmr7496419ejc.276.1646332683574;
        Thu, 03 Mar 2022 10:38:03 -0800 (PST)
Received: from ?IPV6:2003:d9:9707:5600:72a3:8cdd:9608:23f8? (p200300d99707560072a38cdd960823f8.dip0.t-ipconnect.de. [2003:d9:9707:5600:72a3:8cdd:9608:23f8])
        by smtp.googlemail.com with ESMTPSA id l9-20020a1709060cc900b006ce04bb8668sm952165ejh.184.2022.03.03.10.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 10:38:03 -0800 (PST)
Message-ID: <5bb10480-e099-84ec-7221-71c04b2c798d@colorfullife.com>
Date: Thu, 3 Mar 2022 19:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/9] nbd-server, nbd-trdump: Add support for logging
 actual data
Content-Language: en-US
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>,
 Manfred Spraul <manfred.spraul@de.bosch.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
 <20220121175711.5083-3-manfred@colorfullife.com>
 <YiCLt2SL/Dc4f4Mt@pc181009.grep.be>
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <YiCLt2SL/Dc4f4Mt@pc181009.grep.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AypF85htj_D.A.JNH.fsQIiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1721
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5bb10480-e099-84ec-7221-71c04b2c798d@colorfullife.com
Resent-Date: Thu,  3 Mar 2022 18:38:23 +0000 (UTC)

Hi Wouter,

On 3/3/22 10:34, Wouter Verhelst wrote:
> On Fri, Jan 21, 2022 at 06:57:04PM +0100, Manfred Spraul wrote:
>> From: Manfred Spraul <manfred.spraul@de.bosch.com>
>>
>> The datalog generated by nbd-server contains only the requests
>> received by the server, not the actual data to be written.
>>
>> This patch adds support to write the actual data.
>>
>> As details:
>> - It is configurable, the default behavior is not changed.
>> - It defines a new magic that is only used for the log file, and uses
>>    an entry with that magic to store the information that the actual
>>    data is stored in the trace file.
>> - It is an incompatible change: Current nbd-trdump utilities will
>>    just fail/produce bad output when called with a new log file,
>>    without a proper error message.
>> - nbd-trdump supports to dump also the messages sent by the
>>    server. Unfortunately, the current server does not log
>>    the sent messages. This change does not fix this.
>>
>> Open:
>> Should nbd-trdump abort when it sees an unknown new log config
>> option? Right now, it is only printed out as "UNKNOWN", but the
>> tool tries to continue anyways.
> It might make sense to issue a warning in that case? Something along the
> lines of:
>
> "WARNING: unknown option found in log file. Will try to parse the log file, but
> this may fail. You have been warned!"

Ok, I'll update the output.

> +					break;
> +				default:
> +					printf("TRACE_OPTION ? Unknown type\n");
+ printf("Warning: Will try to parse the log file, but output may be 
corrupted");
> +				}
> +			} else {
> +				printf("TRACE_OPTION ? Unknown FROM_MAGIC\n");
+ printf("Warning: Will try to parse the log file, but output may be 
corrupted");

> +			}
> +			break;
> +
>   		default:
>   			printf("? Unknown transaction type %08x\n",magic);
+ printf("...");
>   			break;

>> Known bugs:
>> Locking is missing. If multiple clients connect, then the data log
>> will be unusable.
> Since this is mainly a debugging tool, I don't think that's a problem.

Here I would disagree (and I have already written the locking):

a) Nothing is worse than a debug tool with known issues. Noone would 
trust the output, as it is not clear if it is valid or not.

b) Since I have added logging of the replies as well: From what I 
understand, the replies are sent by worker threads. Thus even a single 
client is enough to cause corrupt logs.

And, since sem_open() is allowed: it is not that difficult to implement.


--

     Manfred

