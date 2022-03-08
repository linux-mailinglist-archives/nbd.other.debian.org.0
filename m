Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9034D1F0F
	for <lists+nbd@lfdr.de>; Tue,  8 Mar 2022 18:26:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6FD4B2022F; Tue,  8 Mar 2022 17:26:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  8 17:26:47 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2B16F201D6
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Mar 2022 17:26:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.891 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WqSBSxGE_QpO for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Mar 2022 17:26:33 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ed1-x52c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E34F4201CC
	for <nbd@other.debian.org>; Tue,  8 Mar 2022 17:26:33 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s10so4216942edd.0
        for <nbd@other.debian.org>; Tue, 08 Mar 2022 09:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CGvQt1ESusWtOZEqE0BxffDR1abWY+sS5ZW8MtL41VE=;
        b=0CkeyQxn7SilSipEc4thCtrBK32Q0LFKyGyx2b1Fy2JSortbKzmV2lczHEVL4O3xj6
         09EvJ/SS7NNyUxw3dcGsNPMszAp6PkOQCsshzrKxFKV9OdevUpVjuYtbk83YFmr5oPmd
         wpeLgkFd3eov9O3xEoKr6iElwS1+FijAyyfENxzXOzrG8ZJ+KCWCOewOa9Zjqp3yYJD0
         /32FOSTjsh8nFj3j1uwDI6NCeqjjJNk/Ye7e0k1+iJAkhK7rMvpiayaLhIfIrgiBf9hK
         HtvhJulk1w7OOwGVFiJhOUXnY/DQR3mplllPhsnQxRvWNyQlB4+4hRQlU+x28nOyhI9T
         GQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CGvQt1ESusWtOZEqE0BxffDR1abWY+sS5ZW8MtL41VE=;
        b=JmgrvQqpBQOpyZHmmKfXW4YyfNOsxpRSPWXzmVd1U2pgUUYH1j+p2iCphSLZCiDXe9
         TH8EG61phXKPqjP+TkM0wryr3iAcvV3DyYCZkUs3Egi5FFITsO7FjOi4DHWVqHDKGDtL
         kqmnAOiROtIXbsEQaWI6Sz+PdcWkKSqRjHTVvIjraLcHF/gymcESBzkjFoToZpYfWXC0
         TwYF/YfefeJ1yoLdKJPXRkVP2cCKeZD6CXt6PYCWo7uqVxGS31t1ny5/pIWIxhwDcWYS
         XbefwLEvzff8km+nsdLWRcPwlAClR111SSsc1L/DiitKd/ahK06d0pRu4owC7nP1l0pc
         dPyg==
X-Gm-Message-State: AOAM531vlSqGeNuqeE6btE0PW2TlZid8zsEC3xik7+deEV6RlJ78Gpeo
	VcC6tv2P5AZCKJH+Z02nfr+zww==
X-Google-Smtp-Source: ABdhPJzmaU2tWNKo4P6XzuLhTt0eLrNzS7YpSS989I+raIaligRaVYIwHOl3pWGw25YzjkgPYGCCyA==
X-Received: by 2002:a05:6402:7cb:b0:415:f059:c817 with SMTP id u11-20020a05640207cb00b00415f059c817mr17262207edy.364.1646760390718;
        Tue, 08 Mar 2022 09:26:30 -0800 (PST)
Received: from ?IPV6:2003:d9:9709:400:ceff:79f6:752:6619? (p200300d997090400ceff79f607526619.dip0.t-ipconnect.de. [2003:d9:9709:400:ceff:79f6:752:6619])
        by smtp.googlemail.com with ESMTPSA id lb10-20020a170907784a00b006db0aadcbd1sm3481377ejc.219.2022.03.08.09.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 09:26:29 -0800 (PST)
Message-ID: <61b83e7c-cae6-ffae-3883-ed709ac1b133@colorfullife.com>
Date: Tue, 8 Mar 2022 18:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: AW: [PATCH 2/2] nbd-trplay: Add test case
Content-Language: en-US
To: "Spraul Manfred (XC/QMM21-CT)" <Manfred.Spraul@de.bosch.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Cc: Wouter Verhelst <w@uter.be>
References: <20220308064944.12439-1-manfred@colorfullife.com>
 <20220308064944.12439-3-manfred@colorfullife.com>
 <AS8PR10MB4835BA9A023C3BC1E04EDA10BF099@AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM>
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <AS8PR10MB4835BA9A023C3BC1E04EDA10BF099@AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HPDA-DO0DCI.A.LIF.XH5JiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1731
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/61b83e7c-cae6-ffae-3883-ed709ac1b133@colorfullife.com
Resent-Date: Tue,  8 Mar 2022 17:26:47 +0000 (UTC)

Hi,

sorry for the noise:
(You shall not read mails using Outlook)

On 3/8/22 08:00, Spraul Manfred (XC/QMM21-CT) wrote:
> Hi,
>
> Replying to myself:
>> diff --git a/tests/run/Makefile.am b/tests/run/Makefile.am index f41eb8d..4c2f635 100644
>> --- a/tests/run/Makefile.am
>> +++ b/tests/run/Makefile.am
>> @@ -4,7 +4,7 @@ else
>>   TLSSRC =
>>   endif
>>   TESTS_ENVIRONMENT=$(srcdir)/simple_test
>> -TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity dirconfig list inetd \
>> +TESTS = cfg1 cfgmulti cfgnew cfgsize write flush integrity replay
>> +dirconfig list inetd \
>>   	rowrite tree rotree unix integrityhuge handshake tls tlswrongcert tlshuge  XFAIL_TESTS=@RUN_XFAIL@  check_PROGRAMS = nbd-tester-client @@ -19,7 +19,7 @@ nbd_tester_client_CFLAGS += @GnuTLS_CFLAGS@  nbd_tester_client_LDADD += @GnuTLS_LIBS@  endif  CLEANFILES = buffer.c crypto-gnutls.c cliserv.c -EXTRA_DIST = integrity-test.tr integrityhuge-test.tr simple_test certs/client-key.pem certs/client-cert.pem certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md certs/selfsigned-cert.pem certs/selfsigned-key.pem
>> +EXTRA_DIST = integrity-test.tr integrityhuge-test.tr replay-test.tr
>> +simple_test certs/client-key.pem certs/client-cert.pem
>> +certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info
>> +certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md
>> +certs/selfsigned-cert.pem certs/selfsigned-key.pem
> This can't be correct. I wanted to add replay-test.tr to a line, not add 5 new lines :-(

The tests work as expected.

(tested by modifying the nbd source rpm and then rebuilding it. With an 
incorrect md5sum, the build then fails)

<<<

1987: Requests: 0
** Message: 18:09:07.336: 11987: Throughput write test (without flushes) 
complete. Took 0.164 seconds to complete, 24.336Mib/s
PASS: write
./flush
12009: Requests: 0
** Message: 18:09:17.539: 12009: Throughput write test (with flushes) 
complete. Took 0.160 seconds to complete, 24.966Mib/s
PASS: flush
./integrity
12032: Seq 00068992 Queued: 00000000 Inflight: 00000000 Done: 00068990
** Message: 18:09:30.268: 12032: Integrity read test complete. Took 
2.688 seconds to complete, 115.337Mib/s
PASS: integrity
./replay
12055: Seq 00000004 Queued: 00000000 Inflight: 00000000 Done: 00000002
** Message: 18:09:40.318: 12055: Integrity read test complete. Took 
0.001 seconds to complete, 5.836Mib/s
PASS: replay
./dirconfig
12097: Requests: 0
** Message: 18:09:50.723: 12097: Throughput read test (without flushes) 
complete. Took 0.209 seconds to complete, 19.097Mib/s
PASS: dirconfig

 >>>

The only odd line is "Integrity read test".
If I see it right, the option "w" (TEST_WRITE) has no impact for the 
integrity test.
Thus all integrity tests are reported as "read" tests - even though 
something is written.

--

     Manfred

