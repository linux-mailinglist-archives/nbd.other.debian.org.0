Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C6AFBA73
	for <lists+nbd@lfdr.de>; Mon,  7 Jul 2025 20:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A02BC2052D; Mon,  7 Jul 2025 18:15:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul  7 18:15:14 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 44EFC20508
	for <lists-other-nbd@bendel.debian.org>; Mon,  7 Jul 2025 17:58:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kverq9N_DhPK for <lists-other-nbd@bendel.debian.org>;
	Mon,  7 Jul 2025 17:58:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd34.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 60CCA20467
	for <nbd@other.debian.org>; Mon,  7 Jul 2025 17:58:22 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-8762a0866a3so74646839f.2
        for <nbd@other.debian.org>; Mon, 07 Jul 2025 10:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751911099; x=1752515899; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlhHGSQ/to5JfREBHMuV189z1QcskZtPpPgZr7K+mgw=;
        b=X22oxJ6F4NWX9T5nGOQGI/810meaohLorQLtlYTbcFMQ0ekfBkfkPWt0DMvkgXKdCl
         YGHcG1xAE68kc8OgKS3IKBeENQdiDGETck3NoX7z7e1aqJbeyStMO/QEPeSFCJj61XxX
         LeJZyD7ywcmWpapwffxdUOjh+7ASV3AAWrUvSM1HC2MNB5pRaa2YOHmcV8hhfPuV1ruG
         epKaT9XtoFno3cTO6ioKPuT6STJtioURnqqPNHv9IFxsGLZ3JypM6XnmiEHZl8bjSiwF
         +VTaiF8o8U//rYQy4QFPxIPYBQX0nMFI74MLUS5ECALnA3C/8C+DFP4lPKS/13tbY9Po
         3rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751911099; x=1752515899;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlhHGSQ/to5JfREBHMuV189z1QcskZtPpPgZr7K+mgw=;
        b=D7sfCDXqD2yV/l+DrPm0bXtzlBSXGzA5szXl4hhMjWbwdpFgORRPEOb3qioGmKePfc
         7GbE6O0QvYjAtJP3SMJ4orb9OEEmfmYNM95Myu/D76ehB5yq9NcIIGxlDfkpNHEWIcCp
         aMz+RB50Y6B5J7/4JZZ8UPPylzNHg6CTsSQQP5XuzXSwrhKx+wrwGUo3/dwNYX3vWSJl
         WSiCy67GUibagfN/ehslD2NYHbuMLnFQHHn/ZCbY2VHzay3V5hyK5uFsBDwgElGJkH2U
         GhHMxs2oBikdqka6/tZErUIXN9FbIyjkccMi+X7nPMeod9+RD3iewIq7H1i1mJrmLLR0
         6JCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtZ13TZYY3/BQIPn/bLxspTY0gAf1IpfvTVAFQSLlOBpzqjl13h14ffG2g7zDpa6ex7ek=@other.debian.org
X-Gm-Message-State: AOJu0Yz8FO6XBqpC2RmDPjccx3oZtzX8CN4HZiYJH6Y5gL2csa0wFS1f
	+2JOHgEtah1KwH/kcRNZMKcpudFgwuOxjDt+qrEuGAbK3Aaf82l0zntiZzNrqqUNTGk=
X-Gm-Gg: ASbGnctAicljio/vDBitPrDlhN9QM7+URYgW/QyLGAkQ6LnI+vuh5C///yx3S5r5OVT
	ii+0+X1b4Rsaq0nX4uXMnnIBxq84wGfr2SSoMreGkA7YJlRLZ+tlHc7AcYCcIaNKXyr33C6+9hf
	3tRz9UwUNb+z0BQg18Blvb7pXEct+zvrLBGPUIWWG3iuYpyPnNivHiGMrk34P9hbqaqBefSa7LU
	YDoEN8Tks1fw6SrJeKDeboztQP46xjVS78xV0oTRhnUTyTLoVB1ddo1UzuT7V3MTGvBSVWJ0eE5
	JLANe2gy4ZaQivZEhFbS6C2d8JdTyPUIOrI/YKiGqeSKKq+WD5BY
X-Google-Smtp-Source: AGHT+IHa1FHDNudpmCs6pJOo3hbLurChWIWuq7ec1KKGFj63vxcmH/wNCoMl/kC22BeFZU0wtqnm9g==
X-Received: by 2002:a05:6602:3413:b0:876:d18f:fb06 with SMTP id ca18e2360f4ac-8794b0275e0mr6348339f.0.1751911098772;
        Mon, 07 Jul 2025 10:58:18 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b5c0e72asm1773155173.100.2025.07.07.10.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 10:58:17 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, xiubli@redhat.com, prasanna.kalever@redhat.com, 
 ming.lei@redhat.com, Zheng Qixing <zhengqixing@huaweicloud.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com, 
 yangerkun@huawei.com, zhengqixing@huawei.com
In-Reply-To: <20250612132405.364904-1-zhengqixing@huaweicloud.com>
References: <20250612132405.364904-1-zhengqixing@huaweicloud.com>
Subject: Re: [PATCH] nbd: fix uaf in nbd_genl_connect() error path
Message-Id: <175191109743.897627.1231024341560474795.b4-ty@kernel.dk>
Date: Mon, 07 Jul 2025 11:58:17 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <biNtuVr3NLM.A.bIIN.y6AboB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3408
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/175191109743.897627.1231024341560474795.b4-ty@kernel.dk
Resent-Date: Mon,  7 Jul 2025 18:15:14 +0000 (UTC)


On Thu, 12 Jun 2025 21:24:05 +0800, Zheng Qixing wrote:
> There is a use-after-free issue in nbd:
> 
> block nbd6: Receive control failed (result -104)
> block nbd6: shutting down sockets
> ==================================================================
> BUG: KASAN: slab-use-after-free in recv_work+0x694/0xa80 drivers/block/nbd.c:1022
> Write of size 4 at addr ffff8880295de478 by task kworker/u33:0/67
> 
> [...]

Applied, thanks!

[1/1] nbd: fix uaf in nbd_genl_connect() error path
      commit: aa9552438ebf015fc5f9f890dbfe39f0c53cf37e

Best regards,
-- 
Jens Axboe



