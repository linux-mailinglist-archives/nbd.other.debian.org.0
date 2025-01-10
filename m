Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 18132A0941D
	for <lists+nbd@lfdr.de>; Fri, 10 Jan 2025 15:48:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D7EED2062E; Fri, 10 Jan 2025 14:48:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 10 14:48:10 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,INVOICE,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 89E512059B
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Jan 2025 14:32:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, INVOICE=3,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Lv1V0oSLVPRy for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Jan 2025 14:32:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd30.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 693152056D
	for <nbd@other.debian.org>; Fri, 10 Jan 2025 14:32:12 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-844e1eb50e2so65900939f.0
        for <nbd@other.debian.org>; Fri, 10 Jan 2025 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1736519528; x=1737124328; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/gcAKNkCa46sAJjco4x4Dt7XCwnmRxnbzpikJ5Iyr8=;
        b=K3sMv75sNBbgB4zB2byC/x4BTL5EiNEdoeNhxdi6dsoLqkcKQUhLhNuV+cLG7SBAvl
         O9hD3NM+f/uxQR3etdcGP/b8tGIiel3XjAYAGsXUAIK5F6bVHZPraAORN7skpeqDal41
         2/Kl8T+qRGmsfSghzi8lNADdraSWNIujOpb6kno/WEqdZYOqFYJcStpNnpJdYkqk/gt2
         KkvL5I31rJaRTg9B0Db6K3/LhNLo9AU4VtJPZaUftJh24BN1yTGCE/FIChSSutW28WMw
         wWKDt7+cRkLvfVMlVagyX4G60RP9pku0I5wRvqGj/dmWl4oTBpN7+gV8v53vlfO4aoXy
         AZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736519528; x=1737124328;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/gcAKNkCa46sAJjco4x4Dt7XCwnmRxnbzpikJ5Iyr8=;
        b=Xvi2lKmqVRm5UmazENwfDaWaLa4o8N9poJp64+q1lHzf19U+PP2jJgubwok2kc2s/S
         FVYNCvtQAF9cIVLX7EZ5Zhq0f9eZ85dAi7DHC7KaCgIGL+K9dtQumtFW/TB2AZwwWLq4
         ABcy8ulpXMug9ITuR+smb9Xzx8z2hDcVpyVnfSXC8PasC/W97jCGfwOrXb9ROznjw2o5
         dXBvT3UFNsTLnXXnsVqC5gJO3X/pp+rRT5aRFU6MXUTe+DKPqejYf9hqzzmO2KEkRQAb
         oEQk43wpzpEqkByDA0ZmzfSu7nF3cIdpvBLF58BRjClDZ47lLhQWXIR2rnSppWMHwtiz
         rDdg==
X-Forwarded-Encrypted: i=1; AJvYcCVVvHw65A/tBWtK0ZmQOt1XlXK4agOzCnD2u0MU2fP9qaxW+xSFAVvnelBkZoVl8tA/40k=@other.debian.org
X-Gm-Message-State: AOJu0YxTBrZEO1jo5XTSOFl3YlOAEizNjcuNKAM6lar4I4RusVhSdHxC
	9no4ZukqZ/kF9Q28yCk/eBIqJwzSbAUINcvP2XZBnhA4VJ8JsazA5MvbqpsYjno=
X-Gm-Gg: ASbGnctkUyj04eWtOlQJKm5wn2iTwg13RHXViT3arIcIMS89jpaHJGOjkr8DS5UDYnn
	onlJl28eYZSMpEVQfp2XosThC1jm5tBVTuQLWrPgd/6r5lDARMGXppKq8uLsoAgWrbFDaJcUEKh
	7vKJK3xqHh2rPf3Z82nUO5kbcjSLQ2nJHioklUBLbDmW4d95Cz9pUyVE04Bz5yT5y40YppFTAev
	nbkNnOL3ITxHjOf3B59eQVMo6InPKT1xpEScj0WMXcnda0=
X-Google-Smtp-Source: AGHT+IHH04d6dGti7fVXw+0NaZh/+tDlC2458jxoW49T1h/PFC0T6YfGUhNP11btFhq4QTA6+HtDyA==
X-Received: by 2002:a05:6602:3585:b0:84a:51e2:9f93 with SMTP id ca18e2360f4ac-84ce00c49f8mr971265339f.9.1736519528352;
        Fri, 10 Jan 2025 06:32:08 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm91086539f.46.2025.01.10.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 06:32:07 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org, 
 linux-nvme@lists.infradead.org, nbd@other.debian.org, 
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
In-Reply-To: <20250110054726.1499538-1-hch@lst.de>
References: <20250110054726.1499538-1-hch@lst.de>
Subject: Re: fix queue freeze and limit locking order v4
Message-Id: <173651952702.758529.3309066666363818120.b4-ty@kernel.dk>
Date: Fri, 10 Jan 2025 07:32:07 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-14bd6
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hG3ATyZrz8J.A.HH7K.qMTgnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3348
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/173651952702.758529.3309066666363818120.b4-ty@kernel.dk
Resent-Date: Fri, 10 Jan 2025 14:48:10 +0000 (UTC)


On Fri, 10 Jan 2025 06:47:08 +0100, Christoph Hellwig wrote:
> this is my version of Damien's "Fix queue freeze and limit locking order".
> A lot looks very similar, but it was done independently based on the
> previous discussion.
> 
> Changes since v3:
>  - more comment fixups
> 
> [...]

Applied, thanks!

[01/11] block: fix docs for freezing of queue limits updates
        commit: 9c96821b44f893fb63f021a28625d3b32c68e8b3
[02/11] block: add a queue_limits_commit_update_frozen helper
        commit: aa427d7b73b196f657d6d2cf0e94eff6b883fdef
[03/11] block: check BLK_FEAT_POLL under q_usage_count
        commit: 958148a6ac061a9a80a184ea678a5fa872d0c56f
[04/11] block: don't update BLK_FEAT_POLL in __blk_mq_update_nr_hw_queues
        commit: d432c817c21a48c3baaa0d28e4d3e74b6aa238a0
[05/11] block: add a store_limit operations for sysfs entries
        commit: a16230649ce27f8ac7dd8a5b079d9657aa96de16
[06/11] block: fix queue freeze vs limits lock order in sysfs store methods
        commit: c99f66e4084a62a2cc401c4704a84328aeddc9ec
[07/11] nvme: fix queue freeze vs limits lock order
        commit: 473106dd3aa964a62314d858f6602c95e40e6270
[08/11] nbd: fix queue freeze vs limits lock order
        commit: f3dec61d7544a90685f1dd9a87fd4afc751996d0
[09/11] usb-storage: fix queue freeze vs limits lock order
        commit: 1233751f7df722435bb93e928d64334db260b90d
[10/11] loop: refactor queue limits updates
        commit: b38c8be255e89ffcdeb817407222d2de0b573a41
[11/11] loop: fix queue freeze vs limits lock order
        commit: b03732a9c0db91522914185739505d92d3b0d816

Best regards,
-- 
Jens Axboe



