Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2CA1B3B07
	for <lists+nbd@lfdr.de>; Wed, 22 Apr 2020 11:18:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A271020488; Wed, 22 Apr 2020 09:18:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 22 09:18:30 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E0C4220404
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Apr 2020 09:01:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YQx_c-pRIS_O for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Apr 2020 09:01:16 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x544.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8235E20403
	for <nbd@other.debian.org>; Wed, 22 Apr 2020 09:01:16 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x26so750564pgc.10
        for <nbd@other.debian.org>; Wed, 22 Apr 2020 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UQDMG4sxhPSdGt8yBRftaMYo19D7wntblzJjX2TGklE=;
        b=YibQfwnAhwk3DmCVSVBByQkG8ozO/w3Rk5ClvMgKnydfOhiA/o1tDkhBWxzFbbOJJW
         f/+F6L33FN2+GkYXmcbgcRetRJ686wLCFxOOXkxCmUSaQlxp6GMOLheLY8DXe6DmnvzA
         RvLs05yetatdt2f+2FqcFa1uLGHHviAXbTO5uhnt+JcF5cAoaNHdLKgtufJq0+DCjXJG
         Nj2oqUD3bRmd5VVaPoX8JGoVEx+kk73FWD9JdzMzOR1E+njuhR9fwe+3gRE6TvCT80BJ
         KLljN3Cun9yokjrCLeR0KemLYmHAhUAJUe/1XlwPls2xMy9LRC/iljPnrv0jo+4UdhSb
         hJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UQDMG4sxhPSdGt8yBRftaMYo19D7wntblzJjX2TGklE=;
        b=IX6pUULv7OdFNikmAocDuIzOvnpda0YuqGZK8NnhcfXnafiAyqv/f36q8RsvRZRvcn
         CxFLX3I8R+hDtAz7mk4GyanqYmv+NvijB5zMif4s57xx26Jrz4x1qbONkpgZ/1IFfNA/
         piMo6oNbO8tHj1+GcYzvfcqo9kR85r+8W87dqCdAULxRB2UNdUv9ANBI4AWOt1MACeZ9
         I1n3ORFJo77wXYbri3XNslWgOX9lrmuhrAMXPNR54MkU29IJPJkH343zT8lH+g3DFzVa
         48MkNOZOJFLWBKzjf3ci3AjBI8E+z0t0R/COb7LOA0eKwga3LJo1vwrJzDImxrlWJcJl
         PACg==
X-Gm-Message-State: AGi0PuZd6f1MOlcPD6PMzW9jVic7dNoXy1OPRDiCWpGXlVNI3bzVvsis
	VkXRabKcIDNLuUQT6V+G2JRdlA==
X-Google-Smtp-Source: APiQypLcs+w53IDgp3BZroig/y72wzEF35ywjDJH8Jptw359SoFjY5cMmnHvidJUoC7U/FxbigLtrw==
X-Received: by 2002:a62:6106:: with SMTP id v6mr27006762pfb.199.1587546073037;
        Wed, 22 Apr 2020 02:01:13 -0700 (PDT)
Received: from debian.bytedance.net ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id p66sm4660054pfb.65.2020.04.22.02.01.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 02:01:12 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mpa@pengutronix.de,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 2/2] nbd: set max discard sectors in the unit of sector
Date: Wed, 22 Apr 2020 05:00:18 -0400
Message-Id: <20200422090018.23210-3-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200422090018.23210-1-houpu@bytedance.com>
References: <20200422090018.23210-1-houpu@bytedance.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uWHbrIVsqlD.A.xuH.mvAoeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/874
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200422090018.23210-3-houpu@bytedance.com
Resent-Date: Wed, 22 Apr 2020 09:18:30 +0000 (UTC)

Change blk_queue_max_discard_sectors from bytes to sector
to be more clearly.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 59c6ce2d2e43..8c59ada4be64 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -304,7 +304,7 @@ static void nbd_size_update(struct nbd_device *nbd)
 	if (config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = config->blksize;
 		nbd->disk->queue->limits.discard_alignment = config->blksize;
-		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
+		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX >> 9);
 	}
 	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
@@ -1224,7 +1224,7 @@ static void nbd_config_put(struct nbd_device *nbd)
 		nbd->tag_set.timeout = 0;
 		nbd->disk->queue->limits.discard_granularity = 0;
 		nbd->disk->queue->limits.discard_alignment = 0;
-		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
+		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX >> 9);
 		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, nbd->disk->queue);
 
 		mutex_unlock(&nbd->config_lock);
-- 
2.11.0

