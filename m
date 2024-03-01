Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3986E57D
	for <lists+nbd@lfdr.de>; Fri,  1 Mar 2024 17:27:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 78C1820A40; Fri,  1 Mar 2024 16:27:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar  1 16:27:13 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7A3A207ED
	for <lists-other-nbd@bendel.debian.org>; Fri,  1 Mar 2024 16:10:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id w1VDf1Hh8uZ9 for <lists-other-nbd@bendel.debian.org>;
	Fri,  1 Mar 2024 16:10:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd31.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7BE5620B28
	for <nbd@other.debian.org>; Fri,  1 Mar 2024 16:10:00 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7c7ee5e2f59so24416739f.1
        for <nbd@other.debian.org>; Fri, 01 Mar 2024 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1709309396; x=1709914196; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJew46mGVrQcepDWbKAtHr/vU7a6ybvJN1TJ5Pc2mp4=;
        b=ifIfAwrzT6SmJj19fZBIaH9oSEATXkrZAoBBEiufNecJ+TUXf0xHj2qO34qZJiU/sG
         zzcekmfcJWy6vNIcru66KVAT7bwG9g/2zGMTXgePyAlVZyzk1vv03RCmqBO4283Ew4Uc
         opXEFW8xFKbFkOl4KFoK//zu7v2iIzm68svDl2C0qB91kw/y4RX0vfhHMmW73CgcCfPu
         0MylVse/XW7tksTrS2xQICEbFMkb5GBh7TB7XwKUQ+a9J1I6tnySgJUYB9/q0A6HrXGB
         BlKVp5Ao0e9FfPgZdSsss3Zi0+jfVpk67UowpTM/h6mJfgZ2cWaSlQedZMm2n5/wFIQ9
         yVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709309396; x=1709914196;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJew46mGVrQcepDWbKAtHr/vU7a6ybvJN1TJ5Pc2mp4=;
        b=sDol0tGhcabfZZDiVTJKQFqjgIdVy9XZB0maO9Es/obfIsrnw8s6E+BjpYr4KUPLR5
         o3MeMZpbtwRwI5LX8gX7PP178WIiNLfP8GVPwRcmoA83kIdbtEUDA9/yQVB8YrCNW6wB
         C4kNSpdQe27s1JCL5kP+Kpl8BGH2mY9oQF6+ZbXDoNLeQ11sU1LNmSLIBQg3Hix/sJM6
         aoU3/Rx0+y7eidHdxCRODrvO4VpuUWJtIlhB4uqni4K5chupiBGY/kylNKf35f95oqZ8
         +iWrcbORb6W1dnkCtBrOOxM1mShUVInkbasWo7fAnx6NFfDCISx1n0BZosJvwS/0+ixC
         p8nw==
X-Forwarded-Encrypted: i=1; AJvYcCWrU2p9Kr9YNGASCf6zbXVGQcePWCbktELaU1dH417O/ze5n5Dpm4LOiaHpBpU50T6fJKnS8q0H6wjQpArC9ODvYndNzg==
X-Gm-Message-State: AOJu0Yyn8/qOUsCOfrebdRFPDPC5YKhzlaCmDHDuei2eBkmD+R0JUkOT
	5VJPvjaGYm8ag+2nfB39I7GaOTSv4Xkiy6RZvL6SJkFjeSxalQ1ShkIx3gZku9MeCaGt9J2CDnt
	5
X-Google-Smtp-Source: AGHT+IHa+2XKvuX/YGHbVraqcL9Od3Ukf1I04lrjP8hK/gZGE1PtSs318j1J4WJuIZhddUhqNtg3Mg==
X-Received: by 2002:a5e:950f:0:b0:7c8:2946:af83 with SMTP id r15-20020a5e950f000000b007c82946af83mr1066682ioj.1.1709309396427;
        Fri, 01 Mar 2024 08:09:56 -0800 (PST)
Received: from [127.0.0.1] ([99.196.129.26])
        by smtp.gmail.com with ESMTPSA id j13-20020a02cc6d000000b00474ab85e3ebsm865136jaq.130.2024.03.01.08.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 08:09:55 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
In-Reply-To: <20240229143846.1047223-2-hch@lst.de>
References: <20240229143846.1047223-1-hch@lst.de>
 <20240229143846.1047223-2-hch@lst.de>
Subject: Re: [PATCH 1/3] nbd: don't clear discard_sectors in nbd_config_put
Message-Id: <170930939076.1106749.1495501234832632960.b4-ty@kernel.dk>
Date: Fri, 01 Mar 2024 09:09:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-7RzAkZX5ED.A.zgF.hHg4lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2778
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/170930939076.1106749.1495501234832632960.b4-ty@kernel.dk
Resent-Date: Fri,  1 Mar 2024 16:27:13 +0000 (UTC)


On Thu, 29 Feb 2024 06:38:44 -0800, Christoph Hellwig wrote:
> nbd_config_put currently clears discard_sectors when unusing a device.
> This is pretty odd behavior and different from the sector size
> configuration which is simply left in places and then reconfigured when
> nbd_set_size is as part of configuring the device.  Change nbd_set_size
> to clear discard_sectors if discard is not supported so that all the
> queue limits changes are handled in one place.
> 
> [...]

Applied, thanks!

[1/3] nbd: don't clear discard_sectors in nbd_config_put
      commit: 7ea201f2cc1da999b9a0a23ea20b64eb2c4719a9
[2/3] nbd: freeze the queue for queue limits updates
      commit: 242a49e5c8784e93a99e4dc4277b28a8ba85eac5
[3/3] nbd: use the atomic queue limits API in nbd_set_size
      commit: 268283244c0f018dec8bf4a9c69ce50684561f46

Best regards,
-- 
Jens Axboe



