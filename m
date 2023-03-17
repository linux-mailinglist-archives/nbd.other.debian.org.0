Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D47AB6BF274
	for <lists+nbd@lfdr.de>; Fri, 17 Mar 2023 21:28:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 907CF2048D; Fri, 17 Mar 2023 20:28:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 17 20:28:34 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F7D92041D
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Mar 2023 20:28:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Srd_CxeJWBBw for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Mar 2023 20:28:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id C9F1A20449
	for <nbd@other.debian.org>; Fri, 17 Mar 2023 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679084879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMNmNTOdx390ioTe9XNiCAi1NYjBrn3x8X89rBxIitg=;
	b=ht/xmudbOpBEsSJYdi1QYktZHzI8kv9sLSp6aqBCnnYVI5qbyiNKzFk2xf4116SixSJcat
	jQ0HTdzwQsX+tGVQKh29nxUc2tvFQZPY7vK/zPro/T2MjdAM4PnMoL7x7AbuMZuOSsu1vE
	hnFpOcnQfNOUSVoDqDc0RS1vxoQ6Jvk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-Mxwocp_hMcOEN5qt7QZfpw-1; Fri, 17 Mar 2023 16:27:58 -0400
X-MC-Unique: Mxwocp_hMcOEN5qt7QZfpw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D7602999B21;
	Fri, 17 Mar 2023 20:27:57 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E243B492B00;
	Fri, 17 Mar 2023 20:27:56 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] block nbd: use req.cookie instead of req.handle
Date: Fri, 17 Mar 2023 15:27:48 -0500
Message-Id: <20230317202749.419094-5-eblake@redhat.com>
In-Reply-To: <20230317202749.419094-1-eblake@redhat.com>
References: <20230317202749.419094-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lf2OcFlRySD.A.yuG.y1MFkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2398
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230317202749.419094-5-eblake@redhat.com
Resent-Date: Fri, 17 Mar 2023 20:28:34 +0000 (UTC)

A good optimizing compiler should not compile this any differently,
but it is nicer to work directly with integers instead of memcpy().

Signed-off-by: Eric Blake <eblake@redhat.com>

---
v2: Fix kernel test robot complaint about wrong endianness on loongarch:
https://lore.kernel.org/oe-kbuild-all/202303121323.Jd35Q1Au-lkp@intel.com/
---
 drivers/block/nbd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8a9487e79f1c..94ae85400b46 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -560,7 +560,6 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 	unsigned long size = blk_rq_bytes(req);
 	struct bio *bio;
 	u64 handle;
-	__be64 tmp;
 	u32 type;
 	u32 nbd_cmd_flags = 0;
 	int sent = nsock->sent, skip = 0;
@@ -607,8 +606,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 		request.len = htonl(size);
 	}
 	handle = nbd_cmd_handle(cmd);
-	tmp = cpu_to_be64(handle);
-	memcpy(request.handle, &tmp, sizeof(tmp));
+	request.cookie = cpu_to_be64(handle);

 	trace_nbd_send_request(&request, nbd->index, blk_mq_rq_from_pdu(cmd));

@@ -729,14 +727,12 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
 	int result;
 	struct nbd_cmd *cmd;
 	struct request *req = NULL;
-	__be64 tmp;
 	u64 handle;
 	u16 hwq;
 	u32 tag;
 	int ret = 0;

-	memcpy(&tmp, reply->handle, sizeof(tmp));
-	handle = be64_to_cpu(tmp);
+	handle = be64_to_cpu(reply->cookie);
 	tag = nbd_handle_to_tag(handle);
 	hwq = blk_mq_unique_tag_to_hwq(tag);
 	if (hwq < nbd->tag_set.nr_hw_queues)
-- 
2.39.2

