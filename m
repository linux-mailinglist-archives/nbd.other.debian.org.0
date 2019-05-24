Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B8298F8
	for <lists+nbd@lfdr.de>; Fri, 24 May 2019 15:33:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A3BB520713; Fri, 24 May 2019 13:33:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 24 13:33:08 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9EAFC206BE
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 May 2019 13:17:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tOHJZj7NDBeB for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 May 2019 13:17:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BE2EB203B4
	for <nbd@other.debian.org>; Fri, 24 May 2019 13:17:20 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id v69so2124176vke.0
        for <nbd@other.debian.org>; Fri, 24 May 2019 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uZ0Zg2uNirK9y14G1GGlkyl+JyTXOEhOPCDV27xwj8c=;
        b=KVMIGYPAnG8rCkGjZMc5w+BUKN3bsquzT+RjW3mWL8+At7Zi2zogqW+Xd6kiPBCctA
         4dE7ML06tMw3uJNZT/659ydbjB/R1C+JWBdxsVIePOWjQjgHP+hC8Z4+wzyCd79LMjAe
         5miSfzE55s6KgkstL7V/0JTa+LyCyKcWAnJ1WzdO1UDAN3QRFW962kdB8g1wKgrYNybV
         h8ntSwUZX+4EHuUhKd5AEuognCDKVtgGoj8PpC8zaLHwHTfCDN+A89Cy6uLItyZmywxk
         rlgfeNQUQcvoGGPU6j8LtoQZS8g2ylCMixTXz1PmCeK7z22xOjFCuEoQPwKad01b42hW
         ZPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uZ0Zg2uNirK9y14G1GGlkyl+JyTXOEhOPCDV27xwj8c=;
        b=U71Mf16Qb/bvZPLIMPjzQ31JPReb412Mm+wGKmD5+Y9hORSIFnYPwwFlmNporLRvMe
         Z9ezkJeLFYQvLdk3YuKhv1W9+p1nEz4wDggzQa4Fx2Cx8ExQZrpaDeh4KyV/oKNhZFQG
         G4JDjfWlfb20cvxbCTtrMV1/T2vUNTDQaQ9fpSfDj4SpnaVfhwjc0043vVjEzd5x7BYR
         OqVlvNcsjbZLDk07tA4tCaqiiXEJhO3s9cfRSm1zPluFfyaJx9QjPfs7ex9f9fpWMJsj
         VVA0+gqH6viQLkyXzU6kXsDt9Jl0Hz4Y5PKXg/vWPlqvGd/xFvMNMzSa3bv2I/zto0a3
         R9nA==
X-Gm-Message-State: APjAAAWxAhqvvW7aMUXQmxaDzDOfzBxB7AEm1CK+3e3Ety3sxQrZYQst
	PeX/f8PmEqhNUUf18NW6L3W1xg==
X-Google-Smtp-Source: APXvYqwbxvb1agF6wdEfvSucciNSzicTQUfXHMAfETxwg9x9k6nYAbdxRWEXFj3tTX26smk+8dleRQ==
X-Received: by 2002:a1f:3ad1:: with SMTP id h200mr4754507vka.24.1558703837630;
        Fri, 24 May 2019 06:17:17 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e914])
        by smtp.gmail.com with ESMTPSA id l31sm610274uae.15.2019.05.24.06.17.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 06:17:16 -0700 (PDT)
Date: Fri, 24 May 2019 09:17:15 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yao Liu <yotta.liu@ucloud.cn>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] nbd: mark sock as dead even if it's the last one
Message-ID: <20190524131714.i3lbkbokad6xmotv@MacBook-Pro-91.local.dhcp.thefacebook.com>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <1558691036-16281-3-git-send-email-yotta.liu@ucloud.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558691036-16281-3-git-send-email-yotta.liu@ucloud.cn>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VAmoYN5fSmE.A.CzB.UK_5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/519
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190524131714.i3lbkbokad6xmotv@MacBook-Pro-91.local.dhcp.thefacebook.com
Resent-Date: Fri, 24 May 2019 13:33:08 +0000 (UTC)

On Fri, May 24, 2019 at 05:43:56PM +0800, Yao Liu wrote:
> When sock dead, nbd_read_stat should return a ERR_PTR and then we should
> mark sock as dead and wait for a reconnection if the dead sock is the last
> one, because nbd_xmit_timeout won't resubmit while num_connections <= 1.

num_connections is the total number of connections that the device was set up
with, not how many are left.  Now since we have the dead_conn_timeout timeout
stuff now which didn't exist when I originally wrote this code I'd be ok with
doing that, but not the way you have it now.  It would be something more like

	if (nbd_disconnected(config) ||
	    (config->num_connections <= 1 &&
	     !config->dead_conn_timeout)

instead.  Thanks,

Josef

