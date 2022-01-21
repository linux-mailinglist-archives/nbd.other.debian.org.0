Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 397FE4964A1
	for <lists+nbd@lfdr.de>; Fri, 21 Jan 2022 18:57:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E070D20521; Fri, 21 Jan 2022 17:57:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 21 17:57:41 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3B1892051D
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jan 2022 17:57:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ldRbXrDX11VG for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jan 2022 17:57:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x42f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C3E4520508
	for <nbd@other.debian.org>; Fri, 21 Jan 2022 17:57:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v6so1084772wra.8
        for <nbd@other.debian.org>; Fri, 21 Jan 2022 09:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RyP7tiJEnEHUuqjmsGUT5mA8jz5FaZ93Yt3hufBt3sg=;
        b=2c63hrrr1/EzJtAIqM9JKVafwbjV2OzUels84Is64u0PEM+RO10VYO5WGQ1ePaBzzi
         v5apkHl0Yc1i5c9DiDMIRwOGq+Eu6TSrTLva6nE2Ca78btFxFVc6pDKykdVOOpn6bhYc
         wwyhwGGFtTfENmi3qaWvGsiK5NxIs3yacE57W1YjCAh80HQ56Bi8outTbic23hhG32j8
         PlFnM9YSpM9x0BxNvYZJRNyMxxakZuEobfS5G8XgrTAiPSqKTzf9Upt/JYP4aFvTZaqK
         AfT+pXaEIXO31mlyrpwDz+FvoD1jlyGgKsetA6GocKE8ZyrlzOLPpYeaflleBsb/Gcpw
         9t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RyP7tiJEnEHUuqjmsGUT5mA8jz5FaZ93Yt3hufBt3sg=;
        b=MfjqamrbbPBYhDBwauUO5iZg5hYY+80N2AqCB792LM5wAbbqPb9PTCqQFUUCjdOcdh
         MTqbAQ6dCf2L/ZdXS8D+eYaZ5xe3Z/SKCmSWp9QwS48+WN8kcJfww3+CNCP2Hwpf0Bvm
         VFjit4tqSizlpQSa666RLvT7rC4fc9pjNxu4tnDJQZ/alytYTgjTKIkZGkoaYF/yMlCt
         zfos02xU2ZaGwy7Nso2dK2SMbmihDEYWQCUHsne3kbj4PtKcJuc6HsBBeTkSWm0ewbUF
         AbszLejoGIK7KyO5ococU5JYC7c2vqclo/IIT6ZpR5eyNMYG7I5DNkJa7LOUiqK1RoPn
         vWjA==
X-Gm-Message-State: AOAM531dEBfq7GVfbft7OK/RaYuY1iKf2P9wxbCalhXumHiJDXAtf/c8
	eivMZEnJBdz9qEl5nRhWh6W1G4rGCGmhRy65
X-Google-Smtp-Source: ABdhPJyFadpFRBSCpPAubaJ2DqYge1fHnaT8ym6VKJWGWmPFabpu6l9vECpND/dEIo/2jCY7OGO0QA==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr4772659wrv.215.1642787843010;
        Fri, 21 Jan 2022 09:57:23 -0800 (PST)
Received: from localhost.localdomain (p200300d997063800e3418724bb165e30.dip0.t-ipconnect.de. [2003:d9:9706:3800:e341:8724:bb16:5e30])
        by smtp.googlemail.com with ESMTPSA id g4sm7166329wrd.12.2022.01.21.09.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 09:57:22 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred@colorfullife.com>
Subject: [PATCH 0/9] Add data to datalog, add replay tool, V03
Date: Fri, 21 Jan 2022 18:57:02 +0100
Message-Id: <20220121175711.5083-1-manfred@colorfullife.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <18rSxKGl0pD.A.ggC.VQv6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1693
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220121175711.5083-1-manfred@colorfullife.com
Resent-Date: Fri, 21 Jan 2022 17:57:41 +0000 (UTC)

Hi,

Updated series.
New is:
- Patch 0004: Update proto.md
- Patch 0009: An initial man page.

Review feedback is welcome!

And: What else is needed for a new tool?
Should I try to create a test case?

--
	Manfred

