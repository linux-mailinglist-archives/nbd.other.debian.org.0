Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B36163D2F
	for <lists+nbd@lfdr.de>; Wed, 19 Feb 2020 07:48:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5D0BC20346; Wed, 19 Feb 2020 06:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 19 06:48:09 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A362D2033A
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 Feb 2020 06:32:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Xvrr0gJoBmi4 for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 Feb 2020 06:32:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pj1-x1041.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5312020174
	for <nbd@other.debian.org>; Wed, 19 Feb 2020 06:32:28 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id d5so2136314pjz.5
        for <nbd@other.debian.org>; Tue, 18 Feb 2020 22:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Qgy6aIuitVSVRLUgnkmkswnIF5SNQ7J4oIPeyJTRMkA=;
        b=Hzru1pusUyGdeV8M6RRcjDJxg2YxJAjf0qtGNjxsY8CpSmP+3yfog4haYzLBPulCK1
         5LXLvLgbLGzXT5ZFqflTQWGZgiT522Cr/YWNm4EI3Om6rfoLEojGad6Pz8Plu22YQGRk
         NbuXYKfdLMzEu55MFm+QlJmkfnRYkR2H+HU7lpkW8Em9QqiUmF74qnKaMUtNe+q2z2tf
         zN+f9NZwezqAVHCD4zsFYa2MvjlN3IFLvjoEM9HjFoCkLVKweND5Q/I6UFk1eDDSgkoT
         QmteUHhQUVQULUYy2VuW2dCR6MMOe/8u7FM7eRpzFW5OnQELnhhEzFuCropOTMppEXpU
         rJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Qgy6aIuitVSVRLUgnkmkswnIF5SNQ7J4oIPeyJTRMkA=;
        b=iiUyGJXoQdWZwVxe9+NoFe0xQEPTYFHHKu8vJEEHMM1kWF07lK8Iug5NKNDinQslDp
         SAzE21F+LplGuzjtRGJB3Q2YxrBv8JlZPJQzvTa7ZIJLTUo7e4oLn8Raz/0DOtq48Kfd
         rYctim/UBorODedQumuP5bhPJLfe3C8zbmTZ6fGpbdRXMZDZliy3VQM958ltDnw2jGKp
         n8XxtRo9KqmW2SUMATINZ/ILHD4VJUlabPsdytFJebBg1cxZmkSok8bxxUviuxQzd37J
         iyi2/r3l8q7ynlo3Amsfy9d4fQHA9gR/zvP16Dgjzoyhge+4HeltXkc/qeCCJKNyf5v3
         R8pw==
X-Gm-Message-State: APjAAAXDqcQMVnBSQcbNEIj9TJlBD3kun3KGw9bq6fzT5f/Bjkal+PXY
	sD7qEomBVJzq/AHqn7n4Tjs=
X-Google-Smtp-Source: APXvYqzIJksnqer7CyInqvYmguad+0IFUcRA20InqN28rnJ/x6iNawGUGLuStBLSgnApI1Gl09UsMg==
X-Received: by 2002:a17:902:223:: with SMTP id 32mr24842193plc.167.1582093944724;
        Tue, 18 Feb 2020 22:32:24 -0800 (PST)
Received: from debian.lc ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id e7sm1184487pfj.114.2020.02.18.22.32.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 22:32:24 -0800 (PST)
From: Hou Pu <houpu.main@gmail.com>
X-Google-Original-From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	mchristi@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 0/2] requeue request if only one connection is configured
Date: Wed, 19 Feb 2020 01:31:05 -0500
Message-Id: <20200219063107.25550-1-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Vm1yR8whHvH.A.S_E.poNTeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/828
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200219063107.25550-1-houpu@bytedance.com
Resent-Date: Wed, 19 Feb 2020 06:48:09 +0000 (UTC)

Hello,

NBD server could be upgraded if we have multiple connections.
But if we have only one connection, after we take down NBD server,
all inflight IO could finally timeout and return error. These
patches fix this using current reconfiguration framework.

I noticed that Mike has following patchset

nbd: local daemon restart support
https://lore.kernel.org/linux-block/5DD41C49.3080209@redhat.com/

It add another netlink interface (NBD_ATTR_SWAP_SOCKETS) and requeue
request immediately after recongirure/swap socket. It do not need to
wait for timeout to fire and requeue in timeout handler, which seems more
like an improvement. Let fix this in current framework first.

Hou Pu (2):
  nbd: enable replace socket if only one connection is configured
  nbd: requeue command if the soecket is changed

 drivers/block/nbd.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

-- 
2.11.0

