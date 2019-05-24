Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8227929587
	for <lists+nbd@lfdr.de>; Fri, 24 May 2019 12:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5DD97205A8; Fri, 24 May 2019 10:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 24 10:12:09 2019
Old-Return-Path: <yotta.liu@ucloud.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EF4D720708
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 May 2019 09:55:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.48 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yL9h67vn1wmt for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 May 2019 09:55:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from m9784.mail.qiye.163.com (m9784.mail.qiye.163.com [220.181.97.84])
	by bendel.debian.org (Postfix) with ESMTP id 11D85206FA
	for <nbd@other.debian.org>; Fri, 24 May 2019 09:55:44 +0000 (UTC)
Received: from kernel_test2.localdomain (unknown [120.132.1.243])
	by m9784.mail.qiye.163.com (Hmail) with ESMTPA id 1AA2E41CAB;
	Fri, 24 May 2019 17:48:52 +0800 (CST)
From: Yao Liu <yotta.liu@ucloud.cn>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] nbd: mark sock as dead even if it's the last one
Date: Fri, 24 May 2019 17:43:56 +0800
Message-Id: <1558691036-16281-3-git-send-email-yotta.liu@ucloud.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
X-HM-Spam-Status: e1kIGBQJHllBWVZKVUpLSUJCQkNLTU9LT0pKWVdZKFlBSUI3V1ktWUFJV1
	kJDhceCFlBWTU0KTY6NyQpLjc#WQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBQ6Lhw*NDg0FCw2ITdNDyxN
	EjpPC0xVSlVKTk5DTUJKSEhJSENDVTMWGhIXVQIUDw8aVRcSDjsOGBcUDh9VGBVFWVdZEgtZQVlK
	SUtVSkhJVUpVSU9IWVdZCAFZQUlKQ083Bg++
X-HM-Tid: 0a6ae93e40cc2086kuqy1aa2e41cab
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qD90AjWMG2H.A.HmB.5N85cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/514
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1558691036-16281-3-git-send-email-yotta.liu@ucloud.cn
Resent-Date: Fri, 24 May 2019 10:12:09 +0000 (UTC)

When sock dead, nbd_read_stat should return a ERR_PTR and then we should
mark sock as dead and wait for a reconnection if the dead sock is the last
one, because nbd_xmit_timeout won't resubmit while num_connections <= 1.

Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
---
 drivers/block/nbd.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 22e86f4..a557a83 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -716,15 +716,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 			if (result <= 0) {
 				dev_err(disk_to_dev(nbd->disk), "Receive data failed (result %d)\n",
 					result);
-				/*
-				 * If we've disconnected or we only have 1
-				 * connection then we need to make sure we
-				 * complete this request, otherwise error out
-				 * and let the timeout stuff handle resubmitting
-				 * this request onto another connection.
-				 */
-				if (nbd_disconnected(config) ||
-				    config->num_connections <= 1) {
+				if (nbd_disconnected(config)) {
 					cmd->status = BLK_STS_IOERR;
 					goto out;
 				}
-- 
1.8.3.1

