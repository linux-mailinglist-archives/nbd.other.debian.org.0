Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BBA23FAE
	for <lists+nbd@lfdr.de>; Fri, 31 Jan 2025 16:30:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9AB10211CE; Fri, 31 Jan 2025 15:30:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 31 15:30:28 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3597721143
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 Jan 2025 15:13:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zry1xHp_838L for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 Jan 2025 15:13:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd32.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 61B2F21155
	for <nbd@other.debian.org>; Fri, 31 Jan 2025 15:13:48 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-844ee166150so55056339f.2
        for <nbd@other.debian.org>; Fri, 31 Jan 2025 07:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738336425; x=1738941225; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+9HC8EV1wWIoNgKbafn8wjlhkFnTml5y5fJi9ZNauA=;
        b=PrWa9/HQAPd/GfAnhnWcTsn96k/kHyV41965tygDyhO/rQltQhkSfNtyWmSeqi6lys
         zFSarsFFFAMCRSrrqOZCeuYlewhCJQrjam35xJGG/M0rlRXli6S9iEyKJrjIypXJ3hNm
         PXVJqAgGE1QfYOZGHMh0tudOF5FkbKlDCeIHZ9f7FGciwbNoZM/G3Rl4nU4iKs3FrJU8
         AfCBnbomKzpuZ6tFucpwTgUIR00Ov8BW/J/xVg8e7zVy43qODMbBFt06gpGOip6tuM4e
         l7fad/hMmN/0EQvZyhLnOTmtw2XKU+Att4Gd+vfmn8/j4eLtAgEEk5Cfn3FdvRwKREYr
         n0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336425; x=1738941225;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+9HC8EV1wWIoNgKbafn8wjlhkFnTml5y5fJi9ZNauA=;
        b=NA6OW6FqyPKF2P9FEHG/xyzsNOQfkBfziNnUO/IASvZ3Kz2Hdu4jHjJM2hbrxVZtrx
         frgnwqPFx3whSsU3UjZupnAW9IbOCtEUODsigiENjA7lZlrlkWmj9/87wesUjRBSR5y0
         uxLavP/2sjNajzOG8DMpTG+18dpE7QGCnA5QIbcpMr3TnSLEfSv6Y1Lu3vJnlusBVMnK
         8g+iuGb6HM1rSgp90dHtuFqlLfI8bB7ArfQ2vpTUns0iFhkI5EpxWrTtiy3v7nS90ezS
         T66GocE6gc9e8le912EwEVi+dlxckv0oB+3kodAmKwOSn2/JCtpHCqS0PHoUAm6MVgTq
         EfFg==
X-Forwarded-Encrypted: i=1; AJvYcCXPSi+iOy2jhZXX2MvPwKmfenUETGyQewbN2v/mhSu5/9zUEBdIR6BZoyJNEc7zpYeOnzg=@other.debian.org
X-Gm-Message-State: AOJu0YxC0/8t/RvLMQH0rnyl8TrcYsabas8RSXI5WaHnALcptVaOnoya
	1euc1q4rUIyAktinJ0oMQwlm7f7cpxsu9D2I8Geci4/kzOU7mpz9PLOHv1LjiWA=
X-Gm-Gg: ASbGnctFwcNkNFn0Ylf/onXWhPAUjEFZhGOtheuASvQna6hQokEalWP8Y9y6itBurIt
	2RmLMuJ6Xsn6hMq5lFxQCpn6FLaVXqD7qltJVa+VIPWteLCMS3wK/hjGHuGUacMhkhc18L7MKfB
	C15qIJy27gi7+6NTgt8T/fJVlf7xO9Rp/qPBFAgSxD8nB8mTsZOjyR8HPkxZ4P1N4aBdEQwOaBu
	YOzQRUQLejLPRsiS/ZocWhV4LsmvLickOrTh/Nmb3nPChK2SaWVnbmM4FjfsLlbDdNWoXfvuPer
	do/98w==
X-Google-Smtp-Source: AGHT+IHdBYkV/Lcjpt9Dx2u2hBI2V53NbB2KTd/PWwFq4iCV5vqkwpfG1ZQm3S6I8vweH0IHJRW4Uw==
X-Received: by 2002:a05:6602:6406:b0:843:ea9a:acc4 with SMTP id ca18e2360f4ac-85427e24fa1mr1154985639f.8.1738336424835;
        Fri, 31 Jan 2025 07:13:44 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746c920dsm856099173.125.2025.01.31.07.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:13:44 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
 nbd@other.debian.org, ceph-devel@vger.kernel.org, 
 virtualization@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
In-Reply-To: <20250131120352.1315351-2-hch@lst.de>
References: <20250131120352.1315351-1-hch@lst.de>
 <20250131120352.1315351-2-hch@lst.de>
Subject: Re: [PATCH] block: force noio scope in blk_mq_freeze_queue
Message-Id: <173833642386.354079.3672902422068183900.b4-ty@kernel.dk>
Date: Fri, 31 Jan 2025 08:13:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-14bd6
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9X5fvAr6A5M.A.EnAC.UyOnnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3364
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/173833642386.354079.3672902422068183900.b4-ty@kernel.dk
Resent-Date: Fri, 31 Jan 2025 15:30:28 +0000 (UTC)


On Fri, 31 Jan 2025 13:03:47 +0100, Christoph Hellwig wrote:
> When block drivers or the core block code perform allocations with a
> frozen queue, this could try to recurse into the block device to
> reclaim memory and deadlock.  Thus all allocations done by a process
> that froze a queue need to be done without __GFP_IO and __GFP_FS.
> Instead of tying to track all of them down, force a noio scope as
> part of freezing the queue.
> 
> [...]

Applied, thanks!

[1/1] block: force noio scope in blk_mq_freeze_queue
      commit: 1e1a9cecfab3f22ebef0a976f849c87be8d03c1c

Best regards,
-- 
Jens Axboe



