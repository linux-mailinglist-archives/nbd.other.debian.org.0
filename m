Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E12E700916
	for <lists+nbd@lfdr.de>; Fri, 12 May 2023 15:21:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AE0ED204A7; Fri, 12 May 2023 13:21:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 12 13:21:12 2023
Old-Return-Path: <ivan.orlov0322@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D2C2C2049F
	for <lists-other-nbd@bendel.debian.org>; Fri, 12 May 2023 13:05:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.839 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id H47KAgIUcHq6 for <lists-other-nbd@bendel.debian.org>;
	Fri, 12 May 2023 13:05:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.25
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2A3F8204A0
	for <nbd@other.debian.org>; Fri, 12 May 2023 13:05:40 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f146de360aso2147916e87.0
        for <nbd@other.debian.org>; Fri, 12 May 2023 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683896737; x=1686488737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCQRjBkP8l0PQhKcHh5TnNSnWxhKMBpH5u3PrLqP5bw=;
        b=gSVtugdu0QcsPWfCv177WCPgmmUIXwjpkxJncUPS9gWAroAhjf8n1PyBgvo+yG2FyM
         AGT9UxdYd/iV5HYbxAg9G9PhyPppuGSo1xmNnevlv70djo7FF012iIYPdJpg5AsdbYkh
         BhKFg/OYk3YHdh1O8qtxffpfw51RxOOQW+P+CwbWqQSmLdWVWQh3m8bTVR2Q2kAcKTn5
         Xq35VcJY+bPGNGQgRBOfkxDfA6iUiHEOy7GH+nXrxZP+Pw3H3QSN06hnvofVCsOxM0c6
         3r/11TnBKqscTYtpRisEqtsEx1pQOf5S1bTLHSrlWu3QEq3HoV0vtxnpxklSaOl3y8Wr
         gdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683896737; x=1686488737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCQRjBkP8l0PQhKcHh5TnNSnWxhKMBpH5u3PrLqP5bw=;
        b=XeJ9qBWsc3P4dXu5DeMgajJ6UU6rF+HiPFjnwQxxsd43CuiR7cZPYZ+MqJABmaMvdv
         J+0HnZDpE/qccKIgNLc11JhNFsPtwRW5LoWaOz76d2dmNSIl2irlbsaEEg9gx5w04HS1
         wmMo4FxdnFvGt0zNMuSRPpxHW9z0XfjEDIu+fHEVFgQ1tviCl7KBmb/Qxo2Mecmr+ZHA
         AxPUHGNfSJVVrjB6uw/Zo0H1Ui4DZbhxC7Zyz+zS0iV3FSHkbssaT2TN1oJZPzYdUtXl
         H61y8fv8oKTgM4VoozXvwJ2CO8Rth/wfEWX/kWjO8uf6OBJ0CFnGy3CM+TGP9sX3m4Xa
         Y3wQ==
X-Gm-Message-State: AC+VfDyF0NH2Z5mOCbKeFY414iOhrjiQbIWWnxOvMiy5tiUuWKl4fJz4
	ozEZcNBNjygArcLCwWfbspc=
X-Google-Smtp-Source: ACHHUZ5HB45FEo0/mPj5ucpEmu76J/nqzc0NAvE+NhUO19q+o09XnzL1yhjtyYr9YcK/hWKQCkXung==
X-Received: by 2002:a05:6512:208:b0:4ee:d640:91eb with SMTP id a8-20020a056512020800b004eed64091ebmr6572026lfo.3.1683896736794;
        Fri, 12 May 2023 06:05:36 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id p17-20020a05651211f100b004f155762085sm1473028lfs.122.2023.05.12.06.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:05:36 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] nbd: Fix debugfs_create_dir error checking
Date: Fri, 12 May 2023 17:05:32 +0400
Message-Id: <20230512130533.98709-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GpL4GzSHNCO.A.nYB.I1jXkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2465
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230512130533.98709-1-ivan.orlov0322@gmail.com
Resent-Date: Fri, 12 May 2023 13:21:12 +0000 (UTC)

The debugfs_create_dir function returns ERR_PTR in case of error, and the
only correct way to check if an error occurred is 'IS_ERR' inline function.
This patch will replace the null-comparison with IS_ERR.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 drivers/block/nbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9c35c958f2c8..65ecde3e2a5b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 		return -EIO;
 
 	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
-	if (!dir) {
+	if (IS_ERR(dir)) {
 		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
 			nbd_name(nbd));
 		return -EIO;
@@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
 	struct dentry *dbg_dir;
 
 	dbg_dir = debugfs_create_dir("nbd", NULL);
-	if (!dbg_dir)
+	if (IS_ERR(dbg_dir))
 		return -EIO;
 
 	nbd_dbg_dir = dbg_dir;
-- 
2.34.1

