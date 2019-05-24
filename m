Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 106D4298D8
	for <lists+nbd@lfdr.de>; Fri, 24 May 2019 15:24:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BF5E1203BC; Fri, 24 May 2019 13:24:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 24 13:24:30 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5BFFF2078B
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 May 2019 13:09:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sS_gE7MFK-Kk for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 May 2019 13:09:03 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A518820788
	for <nbd@other.debian.org>; Fri, 24 May 2019 13:09:03 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id t18so2108247vkb.6
        for <nbd@other.debian.org>; Fri, 24 May 2019 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1NFK9aapiSHvsfIUj35JfqUMZ2Y7KkhyrVEtoE1rNlo=;
        b=EYXxJ25SpuP4HuvEOLSk+zi+mVPSGhOX25UDQE/sUtZJKdvkLF44+bWtW1eWv9AX6+
         /pKQzpJ/ypcCzYcgtZcr7B44gBnyZFJDbYJnpzKHyFra6gwrZ8KSSrmUHBtB1+9TxFPS
         EGwMSJHMVfrBBvWbQzV/sH7BnQXaZqevzNOBAeBOsno0bv22fGAlf5FWntZzalS1VaAI
         ZoPzw2wsj0lnH7LEjts6kFv2LbuozDQLeclYFZIdYVaSHmtbgBQ98HAHq1x05qhuahsE
         Plt7dW56m9PAhslYjZ4hGEtZcUo7cpLNyehcLl1VvBT103zfKklMSuPHhSONGeWcDAt3
         yw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1NFK9aapiSHvsfIUj35JfqUMZ2Y7KkhyrVEtoE1rNlo=;
        b=OAhDuqIKJfWFcvQNmWFRQXnrCJItfDE1RXFwSPLgunA/J+L0y+vGIBKaCh6XADv1Iq
         vkmD1z0gISULn/uwBwFqpJ9CKEsXlu/EbCnA1NLVP8OtPu3tDm2IdxFL7d3a0BpgBWQk
         vWEP6oI6FBN6pPQKOWLqy58Vv2P355kpGApPZwnNIHRD3n/PR2ZZSPFc1nFuaUW0uS1b
         uVv0wdNtwVTCT5oDuuuqrUZNhauRKUrkmkQ5i8vUSpf0BJfs6OD1+OWTrLWpsxGl1Rxm
         TV13l3bcYRKEtWCGMQ3atHNOQX3ugG2KKMW+RROIXYwOnIrvR1WaEKxMulUnxFRqSNXU
         vYpw==
X-Gm-Message-State: APjAAAUS7ecN6PkbYAq8umu/8NPGN6CQUjGJSgCZUuK474a8f6Ys2PLz
	Ld3mLcBlSFmVmzrnqbwB+j+H0g==
X-Google-Smtp-Source: APXvYqwSNSRIsSEWFVwlmbvUZtMXOmCI7hQZGA8lIGGGG7uY/2hEEqrVZAFNsLcsasTdlDybTnGHdg==
X-Received: by 2002:a1f:9d07:: with SMTP id g7mr4795657vke.40.1558703340487;
        Fri, 24 May 2019 06:09:00 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e914])
        by smtp.gmail.com with ESMTPSA id 143sm1127525vkj.44.2019.05.24.06.08.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 06:08:59 -0700 (PDT)
Date: Fri, 24 May 2019 09:08:58 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yao Liu <yotta.liu@ucloud.cn>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nbd: notify userland even if nbd has already
 disconnected
Message-ID: <20190524130856.zod5agp7hk74pcnr@MacBook-Pro-91.local.dhcp.thefacebook.com>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <1558691036-16281-2-git-send-email-yotta.liu@ucloud.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558691036-16281-2-git-send-email-yotta.liu@ucloud.cn>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Q-SWxtlnB-.A.p0H.OC_5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/518
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190524130856.zod5agp7hk74pcnr@MacBook-Pro-91.local.dhcp.thefacebook.com
Resent-Date: Fri, 24 May 2019 13:24:30 +0000 (UTC)

On Fri, May 24, 2019 at 05:43:55PM +0800, Yao Liu wrote:
> Some nbd client implementations have a userland's daemon, so we should
> inform client daemon to clean up and exit.
> 
> Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>

Except the nbd_disconnected() check is for the case that the client told us
specifically to disconnect, so we don't want to send the notification to
re-connect because we've already been told we want to tear everything down.
Nack to this as well.  Thanks,

Josef

