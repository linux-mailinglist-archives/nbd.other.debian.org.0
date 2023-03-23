Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66E6C7169
	for <lists+nbd@lfdr.de>; Thu, 23 Mar 2023 20:57:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B426520600; Thu, 23 Mar 2023 19:57:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 23 19:57:12 2023
Old-Return-Path: <mkoutny@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B17D7205EA
	for <lists-other-nbd@bendel.debian.org>; Thu, 23 Mar 2023 19:40:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	GMAIL=1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qyagvJU8zLhh for <lists-other-nbd@bendel.debian.org>;
	Thu, 23 Mar 2023 19:40:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 572 seconds by postgrey-1.36 at bendel; Thu, 23 Mar 2023 19:40:37 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3FF5B20530
	for <nbd@other.debian.org>; Thu, 23 Mar 2023 19:40:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6C3A1FE14;
	Thu, 23 Mar 2023 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679599834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HUzZ+YdgqBsEPba1gZv82s6tRaXrtHgBuVCrMt0RUvs=;
	b=oPfWJo8BQMP2bDXkj8yCk4RZz/8dJUjmcrxd1fPXcFXKcbhft+1tUJjWQ+FEZMBUAiKfla
	Q5bZOvF+fxnz54/4kxRiPZIR7tWmwGD8hB+FslCHu4Zpn2sS1XGii+T8uToFWJ/KvtwllD
	WAvIfEu6ozAdMQLADb8W9nosUsE7Xj4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 956B1132C2;
	Thu, 23 Mar 2023 19:30:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 5TdRI9qoHGRwLAAAMHmgww
	(envelope-from <mkoutny@suse.com>); Thu, 23 Mar 2023 19:30:34 +0000
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Michal Kubecek <mkubecek@suse.cz>
Subject: [PATCH RESEND v3] nbd_genl_status: null check for nla_nest_start
Date: Thu, 23 Mar 2023 20:30:32 +0100
Message-Id: <20230323193032.28483-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bLXJUMY6XbP.A.cbG.Y8KHkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2407
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230323193032.28483-1-mkoutny@suse.com
Resent-Date: Thu, 23 Mar 2023 19:57:12 +0000 (UTC)

From: Navid Emamdoost <navid.emamdoost@gmail.com>

nla_nest_start may fail and return NULL. The check is inserted, and
errno is selected based on other call sites within the same source code.
Update: removed extra new line.
v3 Update: added release reply, thanks to Michal Kubecek for pointing
out.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
Reviewed-by: Michal Kubecek <mkubecek@suse.cz>
Link: https://lore.kernel.org/r/20190911164013.27364-1-navid.emamdoost@gmail.com/
---

I'm resending the patch because there was apparent consensus of its
inclusion and it seems it was only overlooked. Some people may care
about this because of CVE-2019-16089.

 drivers/block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 592cfa8b765a..109dccd9a515 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2394,6 +2394,12 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
+	if (!dev_list) {
+		nlmsg_free(reply);
+		ret = -EMSGSIZE;
+		goto out;
+	}
+
 	if (index == -1) {
 		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
 		if (ret) {
-- 
2.40.0

