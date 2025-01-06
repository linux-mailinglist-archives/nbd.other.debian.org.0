Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD77A028A3
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 15:57:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8E44520702; Mon,  6 Jan 2025 14:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 14:57:10 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 63F82206D2
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 14:39:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YL3Mqu6vi3iT for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 14:39:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E19B4206CB
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 14:39:32 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-844e9b7e50dso1321195739f.3
        for <nbd@other.debian.org>; Mon, 06 Jan 2025 06:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1736174369; x=1736779169; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBZ4AOeWFFW8Dd9C0Ka6etVGn5iXgyom5RPzMiqZSs8=;
        b=AMeSPnFB878XL7vyJ7epaJAHSmRYdPslq685T/i4BoPU+U6YRN2Uc26aThbLmRTqOP
         wYu1RE51LsgiQI22MQfvSl7CosOMpcp47tmwnXU5a7RL01FPrLHR0Q2df/OkdHx2ExzH
         eWGhR3JaeUqeGylQDRy3oFX++13PLIQQ/SXCGkziCLNTvwCe8tLC0WU372rY1YPlXghq
         Hbvt5NnC8aDwAcqLefVpRkaIZQDPNt2Ww/k12IUPWFyuMgh06V0SaqFMcTzwTbIIHIBo
         JxVUP6NbJoc/M/n+vUjAkbQpQSPDJ6ZdRkFYlbOUEAjhR4MGgAGBL2dLUSfSZba44XLD
         fSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174369; x=1736779169;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBZ4AOeWFFW8Dd9C0Ka6etVGn5iXgyom5RPzMiqZSs8=;
        b=Qyog3QcZP5AvPY1sV1f/RHmxEW1tJsF+TWSv7FQb++logO93JCJey5B2EwHj1y/JG2
         iAmPw/0bdaVowuFoxwcU8raryfRN690xvbUqSTJoRu2aJdEcViwvVhzqw0g+ooNQd0xV
         v0y+kCy7n2D0kNGA7/z2QjDQqNvvWY3DPkvuCHtxYoixtJdR5PmXhIBmPpGrI0NvAugH
         s0PVi2VEcdAdmym6MjzHR5/t4yNnSnzKDi19Pj4cNNX8fvRz1mM5DycTTMy9mq3xQq1t
         BmuxZttjrI/57hlTPdSis0qQkIofmDfZJlepQzNQhnIansYLl+P4bd3EA6sPossc/wpT
         7i1g==
X-Forwarded-Encrypted: i=1; AJvYcCXOt40ZlE4+XW5oeX2ki/JXNF2yRzfW/JoLGrC0nF08TRlOFUa7HkfK2o+ekSElqB32b6o=@other.debian.org
X-Gm-Message-State: AOJu0Yyn9LTaYCM9xwlor+nIN2J1CKyr5VkwNa761Ce1QL3QPIjFFf2P
	Sbs6sMsCLK9P2IWB1XIeVy+HyfSxALP+fQ5BTWp3RG2Q3f8iK4jJtAGCwLkTaVE=
X-Gm-Gg: ASbGncsj0ppjKSTLblYC2IHkHgVhBgOGTQ+Hg6K0DT1cUj8Igxmr1VuSCvYkRmEXMCc
	jYm/tLNbaquFYZl1l8fVDfaIvJyW+t3i6KALcwGL3iBXYO5YqVTdn2kwF50g+47+MXaz/MAyjZI
	Qhr+UfihmiWQMp8Co5RpWaMEFgQDCt2O5Tx/GYmhNwOA5FeOKMK5ZHLURJCDxnXBu6hprQDCoan
	KhlDGAwQ0N9+XGFOQz8Mv7lLqFAAWV8PMYpb3JJW1DRpvU=
X-Google-Smtp-Source: AGHT+IH1FLG78kLDcI08xTsYvucTGiTZynt+yZ3VkITuEG9P6/zBcgc/TiBADuCwXEDnvjNSsx0EwQ==
X-Received: by 2002:a05:6602:1551:b0:844:debf:2c8f with SMTP id ca18e2360f4ac-8499e7d2f5dmr6473585939f.14.1736174369322;
        Mon, 06 Jan 2025 06:39:29 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d7c8308sm879002839f.7.2025.01.06.06.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:39:28 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Yu Kuai <yukuai1@huaweicloud.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com, 
 yangerkun@huawei.com
In-Reply-To: <20250103092859.3574648-1-yukuai1@huaweicloud.com>
References: <20250103092859.3574648-1-yukuai1@huaweicloud.com>
Subject: Re: [PATCH] nbd: don't allow reconnect after disconnect
Message-Id: <173617436792.57123.13624319333213614661.b4-ty@kernel.dk>
Date: Mon, 06 Jan 2025 07:39:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-14bd6
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <p_zTmQGgLRC.A.YK0J.G9-enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3232
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/173617436792.57123.13624319333213614661.b4-ty@kernel.dk
Resent-Date: Mon,  6 Jan 2025 14:57:10 +0000 (UTC)


On Fri, 03 Jan 2025 17:28:59 +0800, Yu Kuai wrote:
> Following process can cause nbd_config UAF:
> 
> 1) grab nbd_config temporarily;
> 
> 2) nbd_genl_disconnect() flush all recv_work() and release the
> initial reference:
> 
> [...]

Applied, thanks!

[1/1] nbd: don't allow reconnect after disconnect
      commit: 844b8cdc681612ff24df62cdefddeab5772fadf1

Best regards,
-- 
Jens Axboe



