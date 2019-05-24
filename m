Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16B29588
	for <lists+nbd@lfdr.de>; Fri, 24 May 2019 12:12:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 56D812065A; Fri, 24 May 2019 10:12:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 24 10:12:19 2019
Old-Return-Path: <yotta.liu@ucloud.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A313C206FA
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 May 2019 09:55:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sRq02gUYV9cO for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 May 2019 09:55:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 457 seconds by postgrey-1.36 at bendel; Fri, 24 May 2019 09:55:44 UTC
Received: from m9784.mail.qiye.163.com (m9784.mail.qiye.163.com [220.181.97.84])
	by bendel.debian.org (Postfix) with ESMTP id C6043206F7
	for <nbd@other.debian.org>; Fri, 24 May 2019 09:55:44 +0000 (UTC)
Received: from kernel_test2.localdomain (unknown [120.132.1.243])
	by m9784.mail.qiye.163.com (Hmail) with ESMTPA id D2F2B41C01;
	Fri, 24 May 2019 17:48:47 +0800 (CST)
From: Yao Liu <yotta.liu@ucloud.cn>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] nbd: notify userland even if nbd has already disconnected
Date: Fri, 24 May 2019 17:43:55 +0800
Message-Id: <1558691036-16281-2-git-send-email-yotta.liu@ucloud.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
X-HM-Spam-Status: e1kIGBQJHllBWVZKVUJNSktLS0lLT0tDTUhZV1koWUFJQjdXWS1ZQUlXWQ
	kOFx4IWUFZNTQpNjo3JCkuNz5ZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngg6EAw6Qjg6NiwQMTdODzw*
	VgwwCg5VSlVKTk5DTUJKSElDSkhDVTMWGhIXVQIUDw8aVRcSDjsOGBcUDh9VGBVFWVdZEgtZQVlK
	SUtVSkhJVUpVSU9IWVdZCAFZQUlKS0I3Bg++
X-HM-Tid: 0a6ae93e302f2086kuqyd2f2b41c01
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <k8LSIHZ6RwJ.A.goB.DO85cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/515
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1558691036-16281-2-git-send-email-yotta.liu@ucloud.cn
Resent-Date: Fri, 24 May 2019 10:12:19 +0000 (UTC)

Some nbd client implementations have a userland's daemon, so we should
inform client daemon to clean up and exit.

Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
---
 drivers/block/nbd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ca69d6e..22e86f4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -246,7 +246,7 @@ static int nbd_disconnected(struct nbd_config *config)
 static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 				int notify)
 {
-	if (!nsock->dead && notify && !nbd_disconnected(nbd->config)) {
+	if (!nsock->dead && notify) {
 		struct link_dead_args *args;
 		args = kmalloc(sizeof(struct link_dead_args), GFP_NOIO);
 		if (args) {
@@ -1891,7 +1891,6 @@ static void nbd_disconnect_and_put(struct nbd_device *nbd)
 {
 	mutex_lock(&nbd->config_lock);
 	nbd_disconnect(nbd);
-	nbd_clear_sock(nbd);
 	mutex_unlock(&nbd->config_lock);
 	if (test_and_clear_bit(NBD_HAS_CONFIG_REF,
 			       &nbd->config->runtime_flags))
-- 
1.8.3.1

