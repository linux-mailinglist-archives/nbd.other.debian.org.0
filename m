Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE9CBD3F54
	for <lists+nbd@lfdr.de>; Mon, 13 Oct 2025 17:15:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6EC1A2059A; Mon, 13 Oct 2025 15:15:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 13 15:15:23 2025
Old-Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 38D5020413
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Oct 2025 14:59:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Aj55dTCzYX5S for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Oct 2025 14:59:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 522 seconds by postgrey-1.36 at bendel; Mon, 13 Oct 2025 14:59:29 UTC
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A018A2040A
	for <nbd@other.debian.org>; Mon, 13 Oct 2025 14:59:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0322043E28;
	Mon, 13 Oct 2025 14:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80328C4CEE7;
	Mon, 13 Oct 2025 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760367043;
	bh=R89kp0iLYdk1U26/++/e06fNrPuyMTwTnm1iRfn6sSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P3FjiUPiiXXMVThDwxC9HwMY7q+1UACKF9/ezuyfgqW2vmDsx69VhNNFduFVkFf9t
	 iL/iRTJLWXjyNMoulOEVh/AB8ULteeih+vlqVVpJm+fX/tTlrQfhiNPymsg7AoWNfm
	 YmAV2wjD/FXz4d4J+wm3+5lMjsqletEisZcrWESo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com,
	Eric Dumazet <edumazet@google.com>,
	Mike Christie <mchristi@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Yu Kuai <yukuai1@huaweicloud.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1 072/196] nbd: restrict sockets to TCP and UDP
Date: Mon, 13 Oct 2025 16:44:05 +0200
Message-ID: <20251013144317.182186217@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013144314.549284796@linuxfoundation.org>
References: <20251013144314.549284796@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hjMtcO1qeDO.A.BiwD.LeR7oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3456
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20251013144317.182186217@linuxfoundation.org
Resent-Date: Mon, 13 Oct 2025 15:15:23 +0000 (UTC)

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Eric Dumazet <edumazet@google.com>

[ Upstream commit 9f7c02e031570e8291a63162c6c046dc15ff85b0 ]

Recently, syzbot started to abuse NBD with all kinds of sockets.

Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
made sure the socket supported a shutdown() method.

Explicitely accept TCP and UNIX stream sockets.

Fixes: cf1b2326b734 ("nbd: verify socket is supported during setup")
Reported-by: syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/CANn89iJ+76eE3A_8S_zTpSyW5hvPRn6V57458hCZGY5hbH_bFA@mail.gmail.com/T/#m081036e8747cd7e2626c1da5d78c8b9d1e55b154
Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Mike Christie <mchristi@redhat.com>
Cc: Richard W.M. Jones <rjones@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Yu Kuai <yukuai1@huaweicloud.com>
Cc: linux-block@vger.kernel.org
Cc: nbd@other.debian.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 120b75ee703d1..2a959c08bd3cb 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1107,6 +1107,14 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
 	if (!sock)
 		return NULL;
 
+	if (!sk_is_tcp(sock->sk) &&
+	    !sk_is_stream_unix(sock->sk)) {
+		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: should be TCP or UNIX.\n");
+		*err = -EINVAL;
+		sockfd_put(sock);
+		return NULL;
+	}
+
 	if (sock->ops->shutdown == sock_no_shutdown) {
 		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
 		*err = -EINVAL;
-- 
2.51.0



