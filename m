Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6C4D107C
	for <lists+nbd@lfdr.de>; Tue,  8 Mar 2022 07:50:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4FA9B2029F; Tue,  8 Mar 2022 06:50:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  8 06:50:08 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 5685B2029E
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Mar 2022 06:49:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id S_ZmDgrjPhrQ for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Mar 2022 06:49:54 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wm1-x32c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0261C20299
	for <nbd@other.debian.org>; Tue,  8 Mar 2022 06:49:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id i66so10509586wma.5
        for <nbd@other.debian.org>; Mon, 07 Mar 2022 22:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iH3731kF3dzmIka24p3UmFCCyDM0jKi5SVpKrO8GUjI=;
        b=wu5RE2mMHMY/1xFhEFdgmkWg5iAkN+JRPW9X1/W8nBVPJaddqSAMoH0+f62/jqibyc
         i/LT7c536OLPTXWFDNb4hTxUh4GI3Nh+vEYdCsk2BMAEf7N87XBWM9F8MngvJGDoBUju
         KiNS0R/bj9drJPellXDIOZSfQGdcL/Q+pKINi9VHOGTCVKNuPtP0RkhSJAwnyjvYvHsf
         fzhfhh7WY46MRuherWfBZJASDk9uUPABydr9b0EqNgu0cL6Kd3gvpMnIQEcJ35qjGQve
         JAljnF5kZ43r5JyDdjwxnx0qBuEOVqwWAVDuRRPb9ZTtl9o21673N+liFw+XTf51u4vx
         FviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iH3731kF3dzmIka24p3UmFCCyDM0jKi5SVpKrO8GUjI=;
        b=rq0EW3lXMLtdO7DRuMZX+yPlimuTKMBmBDqnflUpQhhHlqaQaGrvg07SiAmVDUCrO7
         /CaqUiXnhYiTzCUhgX56Mk5eagW9M/ZZ5PGb/PmOV9/fVXjvbgWHeUSwIlKWreSN/pak
         MDjSWkuMp5BNiuTvi+jKGuby1n8B2I0sjFCL1X+QxzXbYI0SIL1IXSlzejhmOvJfrA9G
         sbSAfG3OMTYgJnGMenHllUUoAV+EHJFy7FuNfuqYlSkBv1PC3dwWhx1RZGYIXzhywmUZ
         rgj3Uw5eA6Sl6bNCqNVR+2xxkpEJmRb+McBa0GKrqVRQeoQfI3WLIDz5V+F9TRVIeYW1
         bN9A==
X-Gm-Message-State: AOAM533dXOm0BsBNMDDV8cPNeuGHxZoFPq7wm4JZ6wEtylefyLnP5PK8
	f2Gygeo/+IV5ZF3yCWjCh+2klJ9MuM1Sog==
X-Google-Smtp-Source: ABdhPJx/dpnmixw+nrcI3N9Bv5Z4I6G/9iFvl4ftOMt95DbiezyGsujSxUY1A4QrN4p/fS0qLVYmiA==
X-Received: by 2002:a1c:7302:0:b0:381:1f9a:a22b with SMTP id d2-20020a1c7302000000b003811f9aa22bmr2240262wmb.78.1646722191394;
        Mon, 07 Mar 2022 22:49:51 -0800 (PST)
Received: from localhost.localdomain (p200300d997090400ceff79f607526619.dip0.t-ipconnect.de. [2003:d9:9709:400:ceff:79f6:752:6619])
        by smtp.googlemail.com with ESMTPSA id f4-20020a5d4dc4000000b001d8e67e5214sm13092364wru.48.2022.03.07.22.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 22:49:51 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Manfred Spraul <manfred@colorfullife.com>
Subject: [PATCH 1/2] nbd-trdump, nbd-trplay: printf improvements/corrections
Date: Tue,  8 Mar 2022 07:49:43 +0100
Message-Id: <20220308064944.12439-2-manfred@colorfullife.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308064944.12439-1-manfred@colorfullife.com>
References: <20220308064944.12439-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8t38JCXWFSB.A.-BH.gyvJiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1728
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220308064944.12439-2-manfred@colorfullife.com
Resent-Date: Tue,  8 Mar 2022 06:50:08 +0000 (UTC)

Two improvments to the printf output:
- Correct an incorrect printout from nbd-trplay:
  When open() on the the log file fails, the tool incorrectly warns
  that the disk image is inaccessible.

- Both nbd-trdump and nbd-trplay: Add a warning if unknown options
  are encountered.
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

