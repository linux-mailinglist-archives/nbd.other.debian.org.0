Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC3909091
	for <lists+nbd@lfdr.de>; Fri, 14 Jun 2024 18:39:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EFC0120C5B; Fri, 14 Jun 2024 16:39:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 14 16:39:15 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 847F620C50
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Jun 2024 16:23:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.09 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	FOURLA=0.1, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0goE4KNagvTj for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Jun 2024 16:23:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x102c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6571320C29
	for <nbd@other.debian.org>; Fri, 14 Jun 2024 16:23:46 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2c036a14583so400365a91.1
        for <nbd@other.debian.org>; Fri, 14 Jun 2024 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718382222; x=1718987022; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOsdq+Rd2jD/oYTlQL4Vcr47c5ELyE1/1jwJx8ny+zc=;
        b=aaFJG6NUB4SkvaXp2j/j5eAl3JFphtZc/TNfmIKf56iIbucCatvneZSMroGvFcdlHY
         u7sV8Z9Mrdx9smx9o0hiZ04cUO57rMODFIE++83LeL6eciV2xMW+48zxPEty63tRQt1m
         CYSYdRdyTx/T1aynACf7rBtzsvfatOefNhh47WnM8xIjx2O3iZv2UcT4TbkS2PpKJ058
         Ytoq9K+YWUtWJZTDN6mEJY8LrYz7hFRFB8wTTRlAT6y5eCSDZxF9H1wLTMT8JoafE7HJ
         +HN857Q3l6UoMlzbY4+QwLyVHbFb9JYcs4126C2kI/i3Dp0c0byK5qUEAemUX7PyX9V5
         /zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382222; x=1718987022;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOsdq+Rd2jD/oYTlQL4Vcr47c5ELyE1/1jwJx8ny+zc=;
        b=mt/NM18l5WIutoW8J8O0kMoYeFr3bkavM6vQlXwKuX14ZdJ3tm5AQa/Ck0PgJTiXje
         BJa9HOTRDBqQaBmlxul0UarHundg44Edh7TWQ3B5uiI3duOqy4joE1Gny6aDGXctFCEy
         ablcnyaIxOCnLHbnCrZ3DKv2VXkPVkL5HMKRtarY86LrEkvF8z7UBUQZgdCYbUQBQVBJ
         HOrF+foyk+AhR/eb+xk3ABnl1MkxAzl6UGxAjwp1u5Xdna87idpWctS4HdALbI8bQQTH
         ODWENgRmQChciVHEti1EKtEBIj7gb96MJ+WVNWYW/PyiG7kS7rvDiLioIjCmfj6p1dUc
         lvxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKwn4R4Jgg7S/oU+JtEd4LjAl6VdscvfyexxIxpbrOM+HO38oRL5pLaQudftzdZ+x5tndpgK7fsR22x/zZ4MgdXX4UUg==
X-Gm-Message-State: AOJu0YyH+fDyBau0JL0gA5/MEGmRbJX6Aa49APSxhEuKCuADcWAsjpCp
	bmmHck0BrR7j/zQqwqXpV7C6b3y7Wz74aYj1iMV71cTq1lW6AJqGrwVT+6voIFE=
X-Google-Smtp-Source: AGHT+IFzZlkOeh7ub8gHV6v3rJ7EdBnks7HtbNFvAppAM0NMs6uCGvh3Ey3eFD0Th7n1FGRILE+Uqw==
X-Received: by 2002:a17:90a:d313:b0:2c4:da09:e29 with SMTP id 98e67ed59e1d1-2c4dbd431cbmr3209949a91.3.1718382222558;
        Fri, 14 Jun 2024 09:23:42 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c46701absm4112038a91.40.2024.06.14.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:23:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Dongsheng Yang <dongsheng.yang@easystack.cn>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
 nbd@other.debian.org, ceph-devel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
Subject: Re: convert the SCSI ULDs to the atomic queue limits API v2
Message-Id: <171838222101.240089.17677804682941719694.b4-ty@kernel.dk>
Date: Fri, 14 Jun 2024 10:23:41 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0-rc0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lNuyOztv6xE.A.nl-P.zIHbmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3009
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/171838222101.240089.17677804682941719694.b4-ty@kernel.dk
Resent-Date: Fri, 14 Jun 2024 16:39:15 +0000 (UTC)


On Fri, 31 May 2024 09:47:55 +0200, Christoph Hellwig wrote:
> this series converts the SCSI upper level drivers to the atomic queue
> limits API.
> 
> The first patch is a bug fix for ubd that later patches depend on and
> might be worth picking up for 6.10.
> 
> The second patch changes the max_sectors calculation to take the optimal
> I/O size into account so that sd, nbd and rbd don't have to mess with
> the user max_sector value.  I'd love to see a careful review from the
> nbd and rbd maintainers for this one!
> 
> [...]

Applied, thanks!

[01/14] ubd: refactor the interrupt handler
        commit: 5db755fbb1a0de4a4cfd5d5edfaa19853b9c56e6
[02/14] ubd: untagle discard vs write zeroes not support handling
        commit: 31ade7d4fdcf382beb8cb229a1f5d77e0f239672
[03/14] rbd: increase io_opt again
        commit: a00d4bfce7c6d7fa4712b8133ec195c9bd142ae6
[04/14] block: take io_opt and io_min into account for max_sectors
        commit: a23634644afc2f7c1bac98776440a1f3b161819e
[05/14] sd: simplify the ZBC case in provisioning_mode_store
        commit: b3491b0db165c0cbe25874da66d97652c03db654
[06/14] sd: add a sd_disable_discard helper
        commit: b0dadb86a90bd5a7b723f9d3a6cf69da9b596496
[07/14] sd: add a sd_disable_write_same helper
        commit: 9972b8ce0d4ba373901bdd1e15e4de58fcd7f662
[08/14] sd: simplify the disable case in sd_config_discard
        commit: d15b9bd42cd3b2077812d4bf32f532a9bd5c4914
[09/14] sd: factor out a sd_discard_mode helper
        commit: f1e8185fc12c699c3abf4f39b1ff5d7793da3a95
[10/14] sd: cleanup zoned queue limits initialization
        commit: 9c1d339a1bf45f4d3a2e77bbf24b0ec51f02551c
[11/14] sd: convert to the atomic queue limits API
        commit: 804e498e0496d889090f32f812b5ce1a4f2aa63e
[12/14] sr: convert to the atomic queue limits API
        commit: 969f17e10f5b732c05186ee0126c8a08166d0cda
[13/14] block: remove unused queue limits API
        commit: 1652b0bafeaa8281ca9a805d81e13d7647bd2f44
[14/14] block: add special APIs for run-time disabling of discard and friends
        commit: 73e3715ed14844067c5c598e72777641004a7f60

Best regards,
-- 
Jens Axboe



