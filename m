Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADF17B75F3
	for <lists+nbd@lfdr.de>; Wed,  4 Oct 2023 02:45:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 07EE520701; Wed,  4 Oct 2023 00:45:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct  4 00:45:12 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 34C5C206DA
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Oct 2023 00:28:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0JadpsQzQ_sW for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Oct 2023 00:27:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x62b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 12886206D9
	for <nbd@other.debian.org>; Wed,  4 Oct 2023 00:27:54 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c746bc3bceso3296355ad.1
        for <nbd@other.debian.org>; Tue, 03 Oct 2023 17:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1696379271; x=1696984071; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHRzIDUrfbGYb47ryPlH6kljeXi3/VDOViUZIBrK5Ts=;
        b=UmrxpuN/9AdQOp8w7SufncC7dqBn9DCO/d4vsHo+w/UKKpgXIjCQSDMF5YzADFoHyC
         yc22qNCB5QMmYEv0F0Jl2zp76ULOEDCcI3SW1bCvCe6lXQBIkBgpRdRQGTNMWOHknrjA
         SZWsUnldhNwgxc5mkYkoW//YpjhkBEskymqWK14711Wc+4TcBRFvD4YKsXsD5+r6YsdO
         DU/6kqjAKCyrCfRqk5Oyt4UQzUKxTOXvwvD/4p6ltpC0D7P7NNxc1NEQnOXCdZMVexcH
         Msa4iSZzpShoh9AScsAT3RG1rRc+vk1uSkJSa7mdRROMPH5+trkjnlK+ttGqC3/bKKZz
         V/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696379271; x=1696984071;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHRzIDUrfbGYb47ryPlH6kljeXi3/VDOViUZIBrK5Ts=;
        b=UZLSfg3NMyoF2J4e/lShoKdfjlx2wuybjiOJHY1wyHxIPYL4HMr3gJvRTAPmJmbmd6
         jyrryPAkeC+vfQzvHZK9OHmpDRSwdWRFYlNEd6CRrLqQEDDzR3EzcPiqQpuhsagcOVSo
         bQ94R+PLpGXyeIAzbZEV3VcCDQaXsWGAANOQWqESqF2KIBE5Xmmo65vCLtzKPIoq2zWf
         eFpZSxondgA/MHCxscR2nza9n7FmN1AJi02u/KmotQT6wD5OjDhwxYrxWvN7WSLfHq7T
         XK56T6G1VoBXuawiBmio0IbIGm/LPtQekNNjVAu9V3rg9zdhlQGT/IPIWu9H04R9HuJz
         13rw==
X-Gm-Message-State: AOJu0Yy/HYMWHcMjKE5ehbLMqzwt2UKQSJ9+c8iW5q9e7bHTZuu8MZBV
	11Hnf87g84D0k8262u0Sj6LOag==
X-Google-Smtp-Source: AGHT+IHupd9ildh+0sHdlF5Fmr98J5f5pg5NGbhnbO6BHNNWicx++llrSuINLPu653oocYznNl1CTg==
X-Received: by 2002:a05:6a20:8f02:b0:15c:b7bb:2bd9 with SMTP id b2-20020a056a208f0200b0015cb7bb2bd9mr850983pzk.6.1696379271422;
        Tue, 03 Oct 2023 17:27:51 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id je1-20020a170903264100b001c0a414695bsm2243499plb.43.2023.10.03.17.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 17:27:50 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Christoph Hellwig <hch@lst.de>
Cc: w@uter.be, linux-block@vger.kernel.org, nbd@other.debian.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
In-Reply-To: <20231003153106.1331363-1-hch@lst.de>
References: <20231003153106.1331363-1-hch@lst.de>
Subject: Re: [PATCH] nbd: don't call blk_mark_disk_dead
 nbd_clear_sock_ioctl
Message-Id: <169637927029.2063894.11456855560323874851.b4-ty@kernel.dk>
Date: Tue, 03 Oct 2023 18:27:50 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HfXUrWTr9TH.A.XFE.YWLHlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2659
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/169637927029.2063894.11456855560323874851.b4-ty@kernel.dk
Resent-Date: Wed,  4 Oct 2023 00:45:13 +0000 (UTC)


On Tue, 03 Oct 2023 17:31:06 +0200, Christoph Hellwig wrote:
> blk_mark_disk_dead is the proper interface to shut down a block
> device, but it also makes the disk unusable forever.
> 
> nbd_clear_sock_ioctl on the other hand wants to shut down the file
> system, but allow the block device to be used again when when connected
> to another socket.  Switch nbd to use disk_force_media_change and
> nbd_bdev_reset to go back to a behavior of the old __invalidate_device
> call, with the added benefit of incrementing the device generation
> as there is no guarantee the old content comes back when the device
> is reconnected.
> 
> [...]

Applied, thanks!

[1/1] nbd: don't call blk_mark_disk_dead nbd_clear_sock_ioctl
      commit: 07a1141ff170ff5d4f9c4fbb0453727ab48096e5

Best regards,
-- 
Jens Axboe



