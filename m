Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7748D2FF
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:39:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C2B712063A; Thu, 13 Jan 2022 07:39:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:39:16 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7D0720636
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:39:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2tb3tL0ipdRd for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:39:02 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wm1-x335.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B53F220627
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:39:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id s6-20020a7bc386000000b0034a89445406so914682wmj.2
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kGLcBJi/38oPNlSEU2uwMWykp8AgcEXcwcT7wJMk2wI=;
        b=1PI+dme3bnWal2YRV9z9mNTUZo24Ib9e8kbfcgdA1UAAeqYjIDuX6b+KWLBfbluEL2
         pfHdVDxGz5Ugje5vUQiUIreb8sYb+hEnhbDUEnVuk8FQ4Lx4fU+Zak7uz8gByF6yRNjr
         kvGp3rBu+HlzzSH+PWO9sNnmZicxFrOfPhIYv+vAz7L5nHP8+NvX1zZrXwy8PmJnQOr4
         0M4gGMoc1kizoM0b9TqRnPAv83szPapz5DT5lbmNIw45HvkBSYvcR/4GCjJYkllUtru1
         y9xY1KbD6dnD9QnKu01G+DCOGLrVIj4lLX8FbJjKtY8WjQe0mvg33yIUuB7Y98jJHD8x
         4snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kGLcBJi/38oPNlSEU2uwMWykp8AgcEXcwcT7wJMk2wI=;
        b=kUp2Gc9i3vdhbboz2TIVZFRJEETgA265htlrGOssz2doOIpPlJ7lkGj6G8Evvi/7wX
         KSTKW2iji2kad3Ck6+UlZTa+pqFxrvepUG7YRX8LoUyv4eO8bkJEupUhjMZWjzkHjsoN
         Xy4jhxKjr+q1rRVrScRvjfhf1PqNKADsY2qKh/l2MClJKFvf4ZNlUpHuHcP0xqFdWTdQ
         B61VunP0S4dAY/0kURR4RSoskrK0hTZMEcy4xHJ/kAX+k5U//XMy4FsUU/rSxEiqumiq
         mYseNM6T0kcUf+mwd6PS6RY3sueZR16Im3yEiy5SMznyvJVrQN2ng2WCjG8PdIwULEEf
         jVxA==
X-Gm-Message-State: AOAM532oMHIY0HGcrHKkOp29tMryuD6mUzIy5ZrQHMC+rfHWu3/UuVVp
	paBHHv8EQHtezkBR3ekt277Zfw==
X-Google-Smtp-Source: ABdhPJw/T19Jj7S+Vf3ee7G6S470711hgpqgO2xH35aBCNTVtjr3MSdXQeVK4a0CCrHpecx2rDAELA==
X-Received: by 2002:a05:600c:1991:: with SMTP id t17mr2626992wmq.25.1642059540059;
        Wed, 12 Jan 2022 23:39:00 -0800 (PST)
Received: from ?IPV6:2003:d9:9704:7900:7258:6cbe:fa5b:7408? (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id p11sm2213907wru.99.2022.01.12.23.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 23:38:59 -0800 (PST)
Message-ID: <c575cbfa-3322-7b44-d7db-32bb348167cb@colorfullife.com>
Date: Thu, 13 Jan 2022 08:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: datalog including written data?
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
References: <fe55642d-be5c-5800-88a2-6fb13c2d2004@colorfullife.com>
 <Yc7mIwx/k0/TS/1q@pc181009.grep.be>
 <20220111204214.dswtdkpa3mfgvsbc@redhat.com>
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <20220111204214.dswtdkpa3mfgvsbc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rPLzKxLMSvB.A.VZG.kc93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1682
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c575cbfa-3322-7b44-d7db-32bb348167cb@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:39:16 +0000 (UTC)

Hi Eric,

On 1/11/22 21:42, Eric Blake wrote:
> On Fri, Dec 31, 2021 at 01:14:43PM +0200, Wouter Verhelst wrote:
>>> b) As first observation:
>>>
>>> https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-server.c#L294
>>>
>>> The server supports
>>>
>>> NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH, NBD_CMD_TRIM,
>>> NBD_CMD_WRITE_ZEROES
>>>
>>> https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-trdump.c#L71
>>>
>>> The trace dump utility supports
>>>
>>> NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH
>>>
>>> -> TRIM and WRITE_ZEROES is missing.
>>>
>>>
>>> Should I create a patch that adds TRIM and WRITE_ZEROES to nbd-trdump?
>> Yes, that might be nice. nbd-trdump hasn't been looked at in a while,
>> which is why TRIM and WRITE_ZEROES haven't been added to it yet.
> It may also be worth adding NBD_CMD_CACHE trace support, even if that
> is not yet implemented in nbd-server.
I'll add that for the next version of the changes.
> That said, it looks like your use of nbd-server transactionlog and
> nbd-trdump is to analyze what happened after the fact.  It would also
> be possible to achieve the same goal (with trim and write_zeroes
> support already working) by using nbdkit's log filter[1], where you
> may also use nbdkit's nbd plugin[2] as an intermediary between any NBD
> server and client in order to inject arbitrary nbdkit filters in the
> chain.
Interesting, I was not aware of nbdkit.

But I would like to concentrate first on one stable implementation.

But I will keep in mind that nbd-trplay should support (in the future) 
multiple log file formats as input.

> [1] https://libguestfs.org/nbdkit-log-filter.1.html
> [2] https://libguestfs.org/nbdkit-nbd-plugin.1.html
>
--

     Manfred

