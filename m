Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEFD4CC553
	for <lists+nbd@lfdr.de>; Thu,  3 Mar 2022 19:39:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3DED1204AA; Thu,  3 Mar 2022 18:39:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  3 18:39:19 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 5094920495
	for <lists-other-nbd@bendel.debian.org>; Thu,  3 Mar 2022 18:39:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mCpJ9q7beGqi for <lists-other-nbd@bendel.debian.org>;
	Thu,  3 Mar 2022 18:39:08 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ej1-x636.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 946E02048C
	for <nbd@other.debian.org>; Thu,  3 Mar 2022 18:39:08 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id p15so12572783ejc.7
        for <nbd@other.debian.org>; Thu, 03 Mar 2022 10:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hlCm4K0MGqCQ57VzunhQiA9qXv2tcFDa6pFh26Pbxus=;
        b=XZnQt/QYzUAn4YOYio6tTO7Y5XAooWuvlLHPjw8UhNqfA21K5w7eNqFNrqk25o10YA
         +F/rTM43jNGyZ2Cjl/L09Iz+l+WoHCcpVeoJrqiTmiy5jMjXmYKdSclgoOJbNitkFaO8
         tb/5hyZTTc2/FHvKRlGPwodnZyP2jAvJqmZzbdXbDoh+3UtPAdBwqUC1F7uQxxdbgdC9
         4vyZd6CZ/jFJNrOXSuFFVtKJGJbN/PMDm5flKY8ZX2Y6dnolUZQoOvLRLis68Tfk+v/X
         pcbUXjI1hagD8x14QmnsgYm3O2MyRsoR9jkvkBEgAezeT/P/g/BsNHfRYqS7OYj6FeCd
         9I7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hlCm4K0MGqCQ57VzunhQiA9qXv2tcFDa6pFh26Pbxus=;
        b=udhS4Hk0zohTUAh1SmZ/6ihx9IYPNhfPwRFyEul5zVXD1O4ab8xqjaz/C48/hLovPI
         3WruaG/eD61GlEajTmpe31subDxVjozFwofj5iVyqjE1T/q+yRKlWJ46qdqBSXEohA8t
         KOA8m4Afy6Tb9Rfg8F32opteokBU1jQMgOVuVDDu2c7HAsjy53cW6El/VrDvp/fv7Mtf
         IW9f1nWBp5fGwpm+bnmupp4sYbP3GUPasMXio0Uf6kWpNx4rmcq3GxpeHT8inDsN8EWs
         A52sFQBIrLurOef/D27pgS+fu1o7KXYYdEByz+8ntZmUb3EqA//33Cc4RNWN00csjSdw
         v9lg==
X-Gm-Message-State: AOAM531IE7OeCrawjOafZO5x1CHBzXa6u6LmykO57omqvERBpNcgQYpf
	MLkczqe/HUjPsGaLNUogV7Zm+Q==
X-Google-Smtp-Source: ABdhPJzeaP63XxsiLboJM9g9HkhZ9Aw1TgBH5FbZWerVtpXaQ/YewHxQLm17jG/Av5QhYz2X+cBzmw==
X-Received: by 2002:a17:906:b1d0:b0:6cd:fa02:b427 with SMTP id bv16-20020a170906b1d000b006cdfa02b427mr28640871ejb.99.1646332745974;
        Thu, 03 Mar 2022 10:39:05 -0800 (PST)
Received: from ?IPV6:2003:d9:9707:5600:72a3:8cdd:9608:23f8? (p200300d99707560072a38cdd960823f8.dip0.t-ipconnect.de. [2003:d9:9707:5600:72a3:8cdd:9608:23f8])
        by smtp.googlemail.com with ESMTPSA id co19-20020a0564020c1300b00412879e4645sm1138210edb.55.2022.03.03.10.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 10:39:05 -0800 (PST)
Message-ID: <fd3852b9-911d-5495-8a02-96b2dbb46c1e@colorfullife.com>
Date: Thu, 3 Mar 2022 19:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/9] Add data to datalog, add replay tool, V03
Content-Language: en-US
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
 <YiCUvrvGpn2Ip1Le@pc181009.grep.be>
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <YiCUvrvGpn2Ip1Le@pc181009.grep.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_cR6b-9NYV.A.jiH.XtQIiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1722
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fd3852b9-911d-5495-8a02-96b2dbb46c1e@colorfullife.com
Resent-Date: Thu,  3 Mar 2022 18:39:19 +0000 (UTC)

On 3/3/22 11:13, Wouter Verhelst wrote:
> Hi Manfred,
>
> On Fri, Jan 21, 2022 at 06:57:02PM +0100, Manfred Spraul wrote:
>> Hi,
>>
>> Updated series.
>> New is:
>> - Patch 0004: Update proto.md
>> - Patch 0009: An initial man page.
>>
>> Review feedback is welcome!
> I had a detailed look today, but didn't have any further feedback.
>
>> And: What else is needed for a new tool?
>> Should I try to create a test case?
> A new test case might be useful, yes.
>
> Note that there are two (somewhat old by now) transaction logs in
> tests/run ("integrity-test.tr" and "integrityhuge-test.tr") that you
> might want to look at.
>
> It could be useful to update nbd-tester-client to also support the new
> transaction log format. Currently we just write zeroes, which works but
> is not ideal; with actual data we might be able to compare checksums etc
> afterwards.

Ok, I'll try to look at it in the next few days.

--

     Manfred


