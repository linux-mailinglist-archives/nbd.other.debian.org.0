Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F24964A4
	for <lists+nbd@lfdr.de>; Fri, 21 Jan 2022 18:57:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 39D5020515; Fri, 21 Jan 2022 17:57:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 21 17:57:58 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5349520513
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jan 2022 17:57:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gNEhZVik8VRm for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jan 2022 17:57:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x430.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DADE320514
	for <nbd@other.debian.org>; Fri, 21 Jan 2022 17:57:28 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v6so1084991wra.8
        for <nbd@other.debian.org>; Fri, 21 Jan 2022 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KYR548xaWrJlbPyyNZIEhvGNP3vO//6xdnRjR+XW+vk=;
        b=ZC3TEnU6P7mtEcVhtuFyIdJDbpOYpBcskUwqwlltQwpnQUZ3YCiHOIdfpGHAJWxjYO
         QsSAIVjSS8+B71t4HBAGb+lpN14RJB3jwffdlVQspTx+3THulmGwWaxXRp39Ro+ZYQxF
         VIA5VBc0oGmtRylmSdjdo2VGQqanJpFfRUvzStvhzly9T5UulXG9vELDOahR5T5EiP8s
         +9HhL+qjhbOZarF7/E5BfGnRGvACndDsg/1mKk1zov60EBRjuGyg+WAMHjmB8bHqLi8f
         WRj0qYDOsLglJZkSvbpclLimRYl+EODhMlnYD9GKk7GIVzAa8vu4ykXZ3ssFl8wXaomO
         Q7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KYR548xaWrJlbPyyNZIEhvGNP3vO//6xdnRjR+XW+vk=;
        b=p1xRgSkVldLhDAJ1VpF8nFf2xdalNS1Rtb872a5aV3NpKL4ZVXnjic8/17VUSLWy5X
         /mlSm4CWoud3WF8+6GPb0KF7IKA7IbgOevcP9FoDNCfPOf0T2atQunnydR6dA+dfDIVq
         7byAVi//x6pSI+2PSdA4C8FIi3P7tJmwFcaD0yJJPrJvrnSwkLkYkTxlBkGX/jSwxtW5
         DgiyMEvZxcf/ssX3ZzJs59S7o/sbzLApinb+SrIjy34JPLoK49e/e2fQIFlStS7b/Bu3
         TvS0YGNpS2w9mm4Lr93DHrtGuTLdDHXlTEGLNcarImWuFiv0nOJ17/verw8AeMsYpurP
         p1Yw==
X-Gm-Message-State: AOAM530uQVlqU1BEcwQE56bzB3bG2Ro4FMC1YCn2IFBbuHDA1v1HEOZu
	WPX2DuHMcZ0tcDq5XL55D9oMINyD5kfjO3ys
X-Google-Smtp-Source: ABdhPJzvTEUmRGZklCzvidPC+kZS/ahDu/v6irqkAL5UL+5uQMrCSqPU7jX+wM57oBCsLWUqkBR5ew==
X-Received: by 2002:a5d:6208:: with SMTP id y8mr4541867wru.433.1642787846265;
        Fri, 21 Jan 2022 09:57:26 -0800 (PST)
Received: from localhost.localdomain (p200300d997063800e3418724bb165e30.dip0.t-ipconnect.de. [2003:d9:9706:3800:e341:8724:bb16:5e30])
        by smtp.googlemail.com with ESMTPSA id g4sm7166329wrd.12.2022.01.21.09.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 09:57:25 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 4/9] proto.md: Document historic values for magics, reserve new value
Date: Fri, 21 Jan 2022 18:57:06 +0100
Message-Id: <20220121175711.5083-5-manfred@colorfullife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GGnBlVK7NYL.A.bmC.mQv6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1697
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220121175711.5083-5-manfred@colorfullife.com
Resent-Date: Fri, 21 Jan 2022 17:57:58 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

Right now:
- The historic values for NBD_REQUEST_MAGIC and NBD_REPLY_MAGIC are
  just documented in nbd.h, without any background.
- The new value that is now used for internal use by nbd-server is
  not documented at all.

Resolve that:
- Add all required information to proto.md.
- Remove the reserved magic values from nbd.h: proto.md is the
  authorative source, double storage doesn't help.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 doc/proto.md | 12 ++++++++++++
 nbd.h        |  1 -
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/doc/proto.md b/doc/proto.md
index 3a877a9..81ac755 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -458,6 +458,18 @@ SHOULD wait until there are no inflight requests first.
 The client and the server MUST NOT initiate any form
 of disconnect other than in one of the above circumstances.
 
+#### Reserved Magic values
+
+The following magic values are reserved and must not be used
+for future protocol extentions:
+
+0x12560953 - Historic value for NBD_REQUEST_MAGIC, used
+	     until Linux 2.1.116pre2.
+0x96744668 - Historic value for NBD_REPLY_MAGIC, used
+	     until Linux 2.1.116pre2.
+0x25609514 - Used by nbd-server to store data log flags in the
+	     transaction log. Never sent from/to a client.
+
 ## TLS support
 
 The NBD protocol supports Transport Layer Security (TLS) (see
diff --git a/nbd.h b/nbd.h
index 31462aa..841d0e5 100644
--- a/nbd.h
+++ b/nbd.h
@@ -68,7 +68,6 @@ enum {
 
 /* for the trace log, not part of the protocol, not sent over the wire */
 #define NBD_TRACELOG_MAGIC 0x25609514
-/* Do *not* use magics: 0x12560953 0x96744668. */
 
 #define NBD_OPT_REPLY_MAGIC 0x3e889045565a9LL
 
-- 
2.34.1

