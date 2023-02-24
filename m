Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD106A1502
	for <lists+nbd@lfdr.de>; Fri, 24 Feb 2023 03:39:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9058220ECF; Fri, 24 Feb 2023 02:39:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 24 02:39:24 2023
Old-Return-Path: <kuba@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1DB0620E63
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 Feb 2023 02:23:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ASxORWZoKqb1 for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 Feb 2023 02:23:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C5DB720EB5
	for <nbd@other.debian.org>; Fri, 24 Feb 2023 02:23:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7AB68B81BE5;
	Fri, 24 Feb 2023 02:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75EDC4339C;
	Fri, 24 Feb 2023 02:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677204787;
	bh=T8YO7qXXdDcbhXt6SJCPTF2VjXN2yI62KcTq2wDk2q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MASLMNP1qw4o4usT4FsOvqS8IfjZwYxD2sVnCWyULhwL6qFYaipczV1x+yWUmH3b3
	 3R6Cq/yI95y9JdiY6TeHl9IH/JAnSncmZP0xJRlr1hoA6Zb7z8fsUGa6PE56PeOHxL
	 qVBW1+IerHmI56vlvfFFsVYvYqsNdWohDtYzeeQzCqomziIzQTS4ZDrpJ9O3iurt1S
	 Aw/GiL6bu8+WHcv2DhIkZA5DyRrP/2G/OxRmrazNGUdQG251WxvZkBNBRmlkL+HEKW
	 NoXnfvVZLaRIYKZ3lWoM/NP6JtVpxtWrgtyWkTRX4iJV+FQ4CW1EYRzRhb31bCAS9v
	 vjJuHUMM5rcUA==
From: Jakub Kicinski <kuba@kernel.org>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH -next 2/2] nbd: use the structured req attr check
Date: Thu, 23 Feb 2023 18:13:01 -0800
Message-Id: <20230224021301.1630703-2-kuba@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224021301.1630703-1-kuba@kernel.org>
References: <20230224021301.1630703-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AqM-kpa7CvO.A.hVE.cNC-jB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2332
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230224021301.1630703-2-kuba@kernel.org
Resent-Date: Fri, 24 Feb 2023 02:39:24 +0000 (UTC)

Use the macro for checking presence of required attributes.
It has the advantage of reporting to the user which attr
was missing in a machine-readable format (extack).

Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/block/nbd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 53e4bb754fd9..c0b1611b9665 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1934,11 +1934,11 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 			return -EINVAL;
 		}
 	}
-	if (!info->attrs[NBD_ATTR_SOCKETS]) {
+	if (GENL_REQ_ATTR_CHECK(info, NBD_ATTR_SOCKETS)) {
 		pr_err("must specify at least one socket\n");
 		return -EINVAL;
 	}
-	if (!info->attrs[NBD_ATTR_SIZE_BYTES]) {
+	if (GENL_REQ_ATTR_CHECK(info, NBD_ATTR_SIZE_BYTES)) {
 		pr_err("must specify a size in bytes for the device\n");
 		return -EINVAL;
 	}
@@ -2123,7 +2123,7 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
 	if (!netlink_capable(skb, CAP_SYS_ADMIN))
 		return -EPERM;
 
-	if (!info->attrs[NBD_ATTR_INDEX]) {
+	if (GENL_REQ_ATTR_CHECK(info, NBD_ATTR_INDEX)) {
 		pr_err("must specify an index to disconnect\n");
 		return -EINVAL;
 	}
@@ -2161,7 +2161,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	if (!netlink_capable(skb, CAP_SYS_ADMIN))
 		return -EPERM;
 
-	if (!info->attrs[NBD_ATTR_INDEX]) {
+	if (GENL_REQ_ATTR_CHECK(info, NBD_ATTR_INDEX)) {
 		pr_err("must specify a device to reconfigure\n");
 		return -EINVAL;
 	}
-- 
2.39.2

