Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6754DE7CA
	for <lists+nbd@lfdr.de>; Sat, 19 Mar 2022 13:12:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 31A05204DC; Sat, 19 Mar 2022 12:12:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 19 12:12:49 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 52A3920527
	for <lists-other-nbd@bendel.debian.org>; Sat, 19 Mar 2022 12:12:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JFcVv-WxiTI3 for <lists-other-nbd@bendel.debian.org>;
	Sat, 19 Mar 2022 12:12:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ej1-x631.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 35A25204DC
	for <nbd@other.debian.org>; Sat, 19 Mar 2022 12:12:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p15so21573945ejc.7
        for <nbd@other.debian.org>; Sat, 19 Mar 2022 05:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azpYTNfYt3XZRKfU1LsX0PZe9LSxMpW94SDuNTRlKoE=;
        b=Z9C+yF4nVb0ez0Z5OFQuU+hoevpQsUUBMfaxyl94UYY7pi2KctUlum3HL5MH4Q2BVb
         WnJePfbTKU2rkLwSiAOOWzzGEAibSR7+fzAAwznfmFcV4eo83jrkpgTz8DiOFUbMw5gv
         Jm+yvIXpX6GLMUAOhjBvUsN8X2jclF99nJM4J8J/fDjnZtqQbZYBNMVaNXIQYqHS3Mt0
         y+K5wKoSn1g1nU8FZclwNgTSFXmhpf0+LrlZamRgz2w2ZNHELjCV3U7XmplDN3axZpQj
         yrVlx34HNMFD8JZnZ7qGnI5QBZl5vG6Q+qBhMJ9gJZ03Cjl1xbQd8HfvuFGcUoslgh0u
         61ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azpYTNfYt3XZRKfU1LsX0PZe9LSxMpW94SDuNTRlKoE=;
        b=FXPYE2DJrc0YiF7Eq94a9xbTm+ybO3jWvtEMt+XkaxUTzL6UfCRLHTo9iZk2z+dY8u
         3OJpcfaqotCUKzHlfpnRG/SOCz08qks/LWUHc4grKDPmOtS92tBmHxTmso6ZST9i23+F
         XYnIx0keQcGzDs+Kln2SKBI4pSBzcvaL/r7N+A6+HJVViop9JWF8THSEiyxyM3oCuFX1
         rX9aF4pi5u+edgXx7sIrIUi+zSpexyhkVo6S2hlvq1zqvfAaEQeLMMwahqJHTv0zxjpe
         i6j4iKzu6/rLKS8LGN7a3VoO2N+ldJJn0ONmNg2LqKsYF49sHMCnlmSi5NbbiLF5rXUd
         PmjA==
X-Gm-Message-State: AOAM5329Xfn5/BoB9Cqfxi4Ecz6AR9B0KHnrmGicLOcNeDpCTUnYhcOJ
	fy/LDuURPL1yJH4UrV75EU8EXiZPmyrPeg==
X-Google-Smtp-Source: ABdhPJxJuRydVxgWtIj6peDDnXBVByMsKnJR+eKIUe7oN6ccQbN5+pN4x+GkeB3vdJaOIYIbGrpqeA==
X-Received: by 2002:a17:907:6e8f:b0:6da:8e96:95f2 with SMTP id sh15-20020a1709076e8f00b006da8e9695f2mr13394473ejc.489.1647691951673;
        Sat, 19 Mar 2022 05:12:31 -0700 (PDT)
Received: from localhost.localdomain (p200300d9974079002dc18ae79cfc5336.dip0.t-ipconnect.de. [2003:d9:9740:7900:2dc1:8ae7:9cfc:5336])
        by smtp.googlemail.com with ESMTPSA id ch26-20020a0564021bda00b00418f99695f0sm3757757edb.23.2022.03.19.05.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 05:12:31 -0700 (PDT)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org,
	Wouter Verhelst <w@uter.be>
Cc: Manfred Spraul <manfred.spraul@de.bosch.com>,
	Eric Blake <eblake@redhat.com>
Subject: [PATCH 1/3] proto.md: correct spelling mistake and bad markdown formatting
Date: Sat, 19 Mar 2022 13:12:25 +0100
Message-Id: <20220319121227.39165-2-manfred@colorfullife.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319121227.39165-1-manfred@colorfullife.com>
References: <20220319121227.39165-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lZQqADBQ-CF.A.pgH.BjcNiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1737
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220319121227.39165-2-manfred@colorfullife.com
Resent-Date: Sat, 19 Mar 2022 12:12:57 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

1) Correct a spelling mistake notice by Eric Blake
2) the resulting .html output from markdown is ugly, thus reformat
   it a bit.

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 doc/proto.md | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 81ac755..d3c0a5e 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -461,14 +461,14 @@ of disconnect other than in one of the above circumstances.
 #### Reserved Magic values
 
 The following magic values are reserved and must not be used
-for future protocol extentions:
-
-0x12560953 - Historic value for NBD_REQUEST_MAGIC, used
-	     until Linux 2.1.116pre2.
-0x96744668 - Historic value for NBD_REPLY_MAGIC, used
-	     until Linux 2.1.116pre2.
-0x25609514 - Used by nbd-server to store data log flags in the
-	     transaction log. Never sent from/to a client.
+for future protocol extensions:
+
+* 0x12560953 - Historic value for NBD_REQUEST_MAGIC, used
+  until Linux 2.1.116pre2.
+* 0x96744668 - Historic value for NBD_REPLY_MAGIC, used
+  until Linux 2.1.116pre2.
+* 0x25609514 - Used by nbd-server to store data log flags in the
+  transaction log. Never sent from/to a client.
 
 ## TLS support
 
-- 
2.35.1

