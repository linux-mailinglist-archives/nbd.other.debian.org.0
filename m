Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AEEA17E
	for <lists+nbd@lfdr.de>; Wed, 30 Oct 2019 17:13:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 64E412091B; Wed, 30 Oct 2019 16:13:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 30 16:13:03 2019
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,
	FOURLA,MD5_SHA1_SUM,MONOTONE_WORDS_2_15,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B4A83207F6
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Oct 2019 15:57:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1,
	MONOTONE_WORDS_2_15=1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PgJvdXVnK1yH for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Oct 2019 15:57:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D809A20816
	for <nbd@other.debian.org>; Wed, 30 Oct 2019 15:57:01 +0000 (UTC)
Received: from sasha-vm.mshome.net (100.50.158.77.rev.sfr.net [77.158.50.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AED042080F;
	Wed, 30 Oct 2019 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572451018;
	bh=1fsxAptcHjRbaUtNupDgJEBnnb6rWnIiTS9hB/14wZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4sfqIP7q5w04rwCDXgg1TrMZM0C5Ey8buAAuV6Xj3wEAlgiDV0cP+TJOgJcVw4LA
	 5mVWuwXlzcR4N5LqA6YB6bGJgE1MoKlHYeETLbnL74XOauaKQ9edw8wm2U9eSKaVuk
	 ChW+9ULY1jyXMRJQXQUbBFoTxOmp/TB7K4UJAHPs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mike Christie <mchristi@redhat.com>,
	syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com,
	"Richard W . M . Jones" <rjones@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 4.14 24/24] nbd: verify socket is supported during setup
Date: Wed, 30 Oct 2019 11:55:55 -0400
Message-Id: <20191030155555.10494-24-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030155555.10494-1-sashal@kernel.org>
References: <20191030155555.10494-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <baYFgSYXt6C.A.kMB.PabudB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/730
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191030155555.10494-24-sashal@kernel.org
Resent-Date: Wed, 30 Oct 2019 16:13:03 +0000 (UTC)

From: Mike Christie <mchristi@redhat.com>

[ Upstream commit cf1b2326b734896734c6e167e41766f9cee7686a ]

nbd requires socket families to support the shutdown method so the nbd
recv workqueue can be woken up from its sock_recvmsg call. If the socket
does not support the callout we will leave recv works running or get hangs
later when the device or module is removed.

This adds a check during socket connection/reconnection to make sure the
socket being passed in supports the needed callout.

Reported-by: syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com
Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Mike Christie <mchristi@redhat.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index f322bb3286910..2fef2efa9051f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -918,6 +918,25 @@ static blk_status_t nbd_queue_rq(struct blk_mq_hw_ctx *hctx,
 	return ret;
 }
 
+static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
+				     int *err)
+{
+	struct socket *sock;
+
+	*err = 0;
+	sock = sockfd_lookup(fd, err);
+	if (!sock)
+		return NULL;
+
+	if (sock->ops->shutdown == sock_no_shutdown) {
+		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
+		*err = -EINVAL;
+		return NULL;
+	}
+
+	return sock;
+}
+
 static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 			  bool netlink)
 {
@@ -927,7 +946,7 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	struct nbd_sock *nsock;
 	int err;
 
-	sock = sockfd_lookup(arg, &err);
+	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
 
@@ -979,7 +998,7 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 	int i;
 	int err;
 
-	sock = sockfd_lookup(arg, &err);
+	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
 
-- 
2.20.1

