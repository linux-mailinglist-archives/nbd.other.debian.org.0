Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DADDD4DE7CB
	for <lists+nbd@lfdr.de>; Sat, 19 Mar 2022 13:12:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B474520527; Sat, 19 Mar 2022 12:12:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 19 12:12:57 2022
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
	by bendel.debian.org (Postfix) with ESMTP id C06932050D
	for <lists-other-nbd@bendel.debian.org>; Sat, 19 Mar 2022 12:12:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bqV40a_tUWET for <lists-other-nbd@bendel.debian.org>;
	Sat, 19 Mar 2022 12:12:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ej1-x635.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 36BBE20519
	for <nbd@other.debian.org>; Sat, 19 Mar 2022 12:12:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p15so21573982ejc.7
        for <nbd@other.debian.org>; Sat, 19 Mar 2022 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zg58nzO2lG7CEDiIs7UuAg4KJu6/XoZWk+D4YVr6TEE=;
        b=wfmrTOd9TyTOgPwykPyueVty8992qEdUcjAcHZJiB4kdoxiCZiH4VggnkGSBEK/Oz2
         Zz7p2Xry9jHNz3CGaambMePpOhXOvTmWQWJoh61OBvhWaGOpur3VX9WXtzSYyFvKHK5/
         KPM2//KOnuDVNm3SNAkIV5J27aF2LAlg9ZchOUOXVg0NHRcW4xFluCr85gYgt6urCv8k
         PK+XwBs/7f8nLQCNGhU6SKYxg/hRAkbBJo1uNi7DIjtRTtbegyefL+GK9m9QqiCEP/kV
         i9aBmU/lR+wXnNQG7Din6juNllp3WtCU2CFUjor9JwgUe1I557HgA2sKzuAgIu56+yb4
         Zb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zg58nzO2lG7CEDiIs7UuAg4KJu6/XoZWk+D4YVr6TEE=;
        b=6DUeEL+2brom+7eqdFkuXZROLlMAnFkb1LCtuKnkpRgrRPeXt0xRwvh2PGR/GgYmEG
         Wq4SraGOUT1tVfOTPJepW2/LdF9E2+g8tIgHW+82T3nIeSPxLHPs3XIBaUStSwSv+uPF
         drBP7ocYoGesm0lIuY3RWPaLQsn7hk9mKOlowhfvH3ILXjl8n27TU34mBM9hzDbCcdst
         BkmgHfBvPQLQhfj4EZFwEdmzpVA0D1TbBTXUiA3euSPq04+5mq0NrKfaFx2VR/X5/j19
         akhhWDiFipYkMxDwn9r8l0404fK5BXp7Bp/j7DSkqVXXnShJ8T8tFaUMAm/Nzdan2APF
         3Ofg==
X-Gm-Message-State: AOAM530MfleiSUk3gut22qwEw41CnOUcGkf2ZWXcDs8mG51s7RM/ZSgR
	iq088+kmqQDxYnkna7TGE3AHaxjHFQ/KDg==
X-Google-Smtp-Source: ABdhPJx7vEvVHPf307EZUtTMx1OLu+j2gPNrbakPRbsIAMn9YUVJ+E19U0AT3M7MD6PevlxCIyFy9A==
X-Received: by 2002:a17:907:7287:b0:6df:8f48:3f76 with SMTP id dt7-20020a170907728700b006df8f483f76mr11638186ejc.411.1647691952456;
        Sat, 19 Mar 2022 05:12:32 -0700 (PDT)
Received: from localhost.localdomain (p200300d9974079002dc18ae79cfc5336.dip0.t-ipconnect.de. [2003:d9:9740:7900:2dc1:8ae7:9cfc:5336])
        by smtp.googlemail.com with ESMTPSA id ch26-20020a0564021bda00b00418f99695f0sm3757757edb.23.2022.03.19.05.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 05:12:32 -0700 (PDT)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org,
	Wouter Verhelst <w@uter.be>
Cc: Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 2/3] nbd-trdump, nbd-trplay: printf improvements/corrections
Date: Sat, 19 Mar 2022 13:12:26 +0100
Message-Id: <20220319121227.39165-3-manfred@colorfullife.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319121227.39165-1-manfred@colorfullife.com>
References: <20220319121227.39165-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <37TqKJkd9aM.A.qjH.JjcNiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1739
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220319121227.39165-3-manfred@colorfullife.com
Resent-Date: Sat, 19 Mar 2022 12:12:57 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

Two improvements to the printf output:
- Correct an incorrect printout from nbd-trplay:
  When open() on the the log file fails, the tool incorrectly warns
  that the disk image is inaccessible.

- Both nbd-trdump and nbd-trplay: Add a warning if unknown options
  are encountered.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-trdump.c | 4 ++++
 nbd-trplay.c | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/nbd-trdump.c b/nbd-trdump.c
index d914e63..c7c5322 100644
--- a/nbd-trdump.c
+++ b/nbd-trdump.c
@@ -130,14 +130,18 @@ int main(int argc, char**argv) {
 					break;
 				default:
 					printf("TRACE_OPTION ? Unknown type\n");
+					printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
+
 				}
 			} else {
 				printf("TRACE_OPTION ? Unknown FROM_MAGIC\n");
+				printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
 			}
 			break;
 
 		default:
 			printf("? Unknown transaction type %08x\n",magic);
+			printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
 			break;
 		}
 		
diff --git a/nbd-trplay.c b/nbd-trplay.c
index 143d8cb..f98b7df 100644
--- a/nbd-trplay.c
+++ b/nbd-trplay.c
@@ -221,9 +221,11 @@ int main_loop(int logfd, int imagefd) {
 					break;
 				default:
 					printf("TRACE_OPTION ? Unknown type\n");
+					printf(" Further log file evaluation may be incorrect, please upgrade nbd-trplay.\n");
 				}
 			} else {
 				printf("TRACE_OPTION ? Unknown FROM_MAGIC\n");
+				printf(" Further log file evaluation may be incorrect, please upgrade nbd-trplay.\n");
 			}
 			break;
 
@@ -301,7 +303,7 @@ int main(int argc, char **argv) {
 		case 'l':
 			logfd = open(optarg, O_RDONLY, 0);
 			if (logfd == -1) {
-				printf("  Opening disk image failed, errno %d.", errno);
+				printf("  Opening log file failed, errno %d.", errno);
 				return 1;
 			}
 			break;
-- 
2.35.1

