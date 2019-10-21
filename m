Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0EDF68F
	for <lists+nbd@lfdr.de>; Mon, 21 Oct 2019 22:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 30197203A9; Mon, 21 Oct 2019 20:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 21 20:12:09 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 92BC7203A0
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Oct 2019 19:56:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aja7iRDBwY37 for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Oct 2019 19:56:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x841.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1C55F20363
	for <nbd@other.debian.org>; Mon, 21 Oct 2019 19:56:36 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so8417326qto.3
        for <nbd@other.debian.org>; Mon, 21 Oct 2019 12:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PB32g4c6uKsJKr+PshalNj6YK9p7R+K1426kl66/DD4=;
        b=uy4N5ISyRi+PhtI1WNJWJ7K6UqSihuB5UunAhvOdCs1SjLfbLhTi94WgWgcE0iZWI9
         y4bDw9Ca8dmLVo3/9eonX2k+/QJmAuYcK9UbGRtCMXutiU5hQJvB2xOmkZbFlHnkh8Fx
         O0RqlDbX7g6k/bGGh+SA9wWYKTkVEMvONZJZaX6DFrlxQc3HkvkyuJZOjaqnZSWxHQ4z
         9qzMTFEbeIkwo+Eh4jqklsFvhgl79a9LM6dr+ztWikzl4E8vvguPvj4OcSPc9qNnlGbX
         BgfmUsEnA0RAFfv8PTStrOZ2w1LdKHfWGmCsHjHnRZ5OMWilRv+EXSc8YB6mH2LNg7/r
         rAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PB32g4c6uKsJKr+PshalNj6YK9p7R+K1426kl66/DD4=;
        b=g0NV/5TqtB4aM+kTY1lhetf+RtiX+akPFemOpDkdH8yBgC3/Jsw48K/pvA7LRjiKKq
         dRFPAcbwp/YXI64bAUHTcqfmt/QV0vsAPHtflwuEJizj/gEPztEp3sgde+2/IemYE8t0
         yshqkjmMLn/hkUQH++0F4oIRFXM5ma70qkmqKb1H9vpBJcIxDcY2f2tSBWxkVt2dcY70
         824j1vAvJfBuVjTiIJWuFJHzhC2x6cRaPLk9nt79uX/fhEt1cfOj1vthOHkEwAwDDkNi
         P3WeuPSWyciWo3vrQV/gal/CxT3aVQImwEJu9i3XCTWOCs6JtHF49V2HVTvDx6vrfXd6
         8k5w==
X-Gm-Message-State: APjAAAW/GBj1M0xqlAcCok5IQLYSSQinkW4fxUrGy56EnSs8kDqo9ANq
	UV9iacxO8cSaj5szbgjKzPzniQ==
X-Google-Smtp-Source: APXvYqxBxLQO23FtAwkOCqWxxqVcL90+WPiI9CK+WkYrNq1ytchniQH3endTRmyibP7ecZPdyxIE/w==
X-Received: by 2002:ad4:5004:: with SMTP id s4mr4812140qvo.87.1571687792790;
        Mon, 21 Oct 2019 12:56:32 -0700 (PDT)
Received: from localhost ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id r29sm7985889qtb.63.2019.10.21.12.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 12:56:32 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: axboe@kernel.dk,
	nbd@other.debian.org,
	linux-block@vger.kernel.org,
	kernel-team@fb.com,
	mchristi@redhat.com
Subject: [PATCH 1/2] nbd: protect cmd->status with cmd->lock
Date: Mon, 21 Oct 2019 15:56:27 -0400
Message-Id: <20191021195628.19849-2-josef@toxicpanda.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191021195628.19849-1-josef@toxicpanda.com>
References: <20191021195628.19849-1-josef@toxicpanda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gCzP_nUBb6J.A.0TE.ZEhrdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/718
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191021195628.19849-2-josef@toxicpanda.com
Resent-Date: Mon, 21 Oct 2019 20:12:09 +0000 (UTC)

We already do this for the most part, except in timeout and clear_req.
For the timeout case we take the lock after we grab a ref on the config,
but that isn't really necessary because we're safe to touch the cmd at
this point, so just move the order around.

For the clear_req cause this is initiated by the user, so again is safe.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a8e3815295fe..8fb8913074b8 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -368,17 +368,16 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	struct nbd_device *nbd = cmd->nbd;
 	struct nbd_config *config;
 
+	if (!mutex_trylock(&cmd->lock))
+		return BLK_EH_RESET_TIMER;
+
 	if (!refcount_inc_not_zero(&nbd->config_refs)) {
 		cmd->status = BLK_STS_TIMEOUT;
+		mutex_unlock(&cmd->lock);
 		goto done;
 	}
 	config = nbd->config;
 
-	if (!mutex_trylock(&cmd->lock)) {
-		nbd_config_put(nbd);
-		return BLK_EH_RESET_TIMER;
-	}
-
 	if (config->num_connections > 1) {
 		dev_err_ratelimited(nbd_to_dev(nbd),
 				    "Connection timed out, retrying (%d/%d alive)\n",
@@ -775,7 +774,10 @@ static bool nbd_clear_req(struct request *req, void *data, bool reserved)
 {
 	struct nbd_cmd *cmd = blk_mq_rq_to_pdu(req);
 
+	mutex_lock(&cmd->lock);
 	cmd->status = BLK_STS_IOERR;
+	mutex_unlock(&cmd->lock);
+
 	blk_mq_complete_request(req);
 	return true;
 }
-- 
2.21.0

