Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 951884F0553
	for <lists+nbd@lfdr.de>; Sat,  2 Apr 2022 20:00:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3ACB920CEE; Sat,  2 Apr 2022 18:00:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Apr  2 18:00:10 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 366C820CC7
	for <lists-other-nbd@bendel.debian.org>; Sat,  2 Apr 2022 17:44:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.344 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LFPmHslr0qYA for <lists-other-nbd@bendel.debian.org>;
	Sat,  2 Apr 2022 17:44:21 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x102e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5801120C59
	for <nbd@other.debian.org>; Sat,  2 Apr 2022 17:44:20 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id mp6-20020a17090b190600b001c6841b8a52so7867213pjb.5
        for <nbd@other.debian.org>; Sat, 02 Apr 2022 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8s/BHQnenI/dQuo9Bx4DjxsKw1aS1YEGBIC6gaAHQig=;
        b=2YbxB5bh+ymmDvqyygbpui3ePOClpWpHpAhDgaVZ4b+x21ZIRXxNXizYRabmSFdHdw
         rsMeU9MGdjqzJKUM7oq7ES6fyl5l1iS2JX9UkDuY5nfUxnjqAqKMHUw/ZHqCzA3Duhyx
         c5deLeG8d6ToSZ5naiKzigUqUhyYhq2w7eS0nBqGjxyaktHEJuXcsZ4mwQfRZaF7mhZ0
         2nLU7awvlzzUy5dNMFwfr9wACNhcpmSKQpVEkrywMIyy6QuKAh7Cq4YzyPtX4mivyjXz
         F7JIH74PZR7kbJwN3f1xfd3SHNr5uPsDT2aF8dwVorczqOFzHQraAS/YjoPM/UM4h8vb
         OZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8s/BHQnenI/dQuo9Bx4DjxsKw1aS1YEGBIC6gaAHQig=;
        b=OSSTRnrKUHJ3bNSnkrTgHfUjmuNYX7eTDPpl61wNMYXugu81vS0TzRZU65fhw7uui8
         ZDP0yLtjz0rP7FOYFVCVfW7YT5YYiUg+PHimaFKBk+3LJLoRvBlE1g6uddQk4V5dLPuO
         LB6ucQJlICVFfs4LjQVavjEhfJTCW9XDldEE6mPL4w7DmeU1HUe1R7szEII6qAgEFguT
         V/QFDOWfyZCz4J4FqP2/aCYSYb5ieIfBiEDDJHOKy9FvyksVusYyYsK4jT4OMVksnVNE
         cLRiZufLzitm+Pup8gKb2ndOCniRKl5Xg+Jnr0sziqs93yeqfHWyUo5A9A6JGFY2HmIf
         PPeQ==
X-Gm-Message-State: AOAM533BsZ09sjOd65GvLuVQwVSAyR6mHsVuMuA0NfWVDC9iNtzOECxc
	NwdJXDJIuRaMK3QdGjKgP6etx2Ffs5OgGg==
X-Google-Smtp-Source: ABdhPJy7B1CwAYnjdOE/0354VIXtcxQQyASRB+QgG3NJzVmtQMei/fO7JcyT4M7r8rC1Jddu+8CZ/w==
X-Received: by 2002:a17:902:d64e:b0:154:bc8f:b6c5 with SMTP id y14-20020a170902d64e00b00154bc8fb6c5mr15908197plh.157.1648921457201;
        Sat, 02 Apr 2022 10:44:17 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9-20020a056a00198900b004fafdb88076sm6943869pfl.117.2022.04.02.10.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 10:44:16 -0700 (PDT)
Message-ID: <9b61c3b4-ee68-856d-65ad-0e95e4d12f11@kernel.dk>
Date: Sat, 2 Apr 2022 11:44:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: nbd, sysfs: cannot create duplicate filename '/dev/block/43:0'
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 lkml <linux-kernel@vger.kernel.org>
References: <YkiJTnFOt9bTv6A2@zn.tnic>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <YkiJTnFOt9bTv6A2@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Wj0R3bJRET.A.C8C.q8ISiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1846
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/9b61c3b4-ee68-856d-65ad-0e95e4d12f11@kernel.dk
Resent-Date: Sat,  2 Apr 2022 18:00:10 +0000 (UTC)

On 4/2/22 11:35 AM, Borislav Petkov wrote:
> Hi,
> 
> so I enabled CONFIG_BLK_DEV_NBD=y on a test box here and I'm getting the
> below.
> 
> Kernel is Linus' branch from today + a couple of unrelated arch/x86/ patches.
> 
> .config is attached.
> 
> Thx.
> 
> ...
> [    4.501239] sysfs: cannot create duplicate filename '/dev/block/43:0'

This is the second report on this this morning. I'm going to revert it
for 5.18-rc1. Thanks for your report!

-- 
Jens Axboe

