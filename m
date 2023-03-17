Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63D6BF275
	for <lists+nbd@lfdr.de>; Fri, 17 Mar 2023 21:28:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9994F2048B; Fri, 17 Mar 2023 20:28:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 17 20:28:45 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,MURPHY_FINANCE10,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8BDC52045E
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Mar 2023 20:28:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.682 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	MURPHY_FINANCE10=0.5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qQlHoaXpVawH for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Mar 2023 20:28:11 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 0725320464
	for <nbd@other.debian.org>; Fri, 17 Mar 2023 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679084885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrOb7zhbNBSA2vEfdnizburgLjEAzsaXpryIF7Glvbk=;
	b=BmVpMVl/+6ymKbDxjh8ZuwN2vF+wv1t/7rcz1wiByTTJsOc8jCjrJFBtkWYNzfgGcM1PVA
	n8BXJ9yTaewx0D3B5dD/qpHwUUe5g0vvnHNAKaSv7T5ebsFuQuOIKHrw+wjZDvxsvS2BvG
	7d0igKpb5v/JXfK85mXm24VCN4Gh6W4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-oN7h2_Q0PUqxhq_LDwb8xg-1; Fri, 17 Mar 2023 16:27:59 -0400
X-MC-Unique: oN7h2_Q0PUqxhq_LDwb8xg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 762FB1011573;
	Fri, 17 Mar 2023 20:27:58 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB66D492B00;
	Fri, 17 Mar 2023 20:27:57 +0000 (UTC)
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
Subject: [PATCH v2 5/5] docs nbd: userspace NBD now favors github over sourceforge
Date: Fri, 17 Mar 2023 15:27:49 -0500
Message-Id: <20230317202749.419094-6-eblake@redhat.com>
In-Reply-To: <20230317202749.419094-1-eblake@redhat.com>
References: <20230317202749.419094-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3mDxa_hrDMJ.A.8wG.91MFkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2399
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230317202749.419094-6-eblake@redhat.com
Resent-Date: Fri, 17 Mar 2023 20:28:45 +0000 (UTC)

While the sourceforge site for userspace NBD still exists, the code
repository moved to github several years ago.  Then with a recent
patch[1], the github landing page contains just as much information as
the sourceforge page, so we might as well point to a single location
that also provides the code.

[1] https://lists.debian.org/nbd/2023/03/msg00051.html

Signed-off-by: Eric Blake <eblake@redhat.com>

---
v2: split into its own patch
---
 Documentation/admin-guide/blockdev/nbd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/blockdev/nbd.rst b/Documentation/admin-guide/blockdev/nbd.rst
index d78dfe559dcf..faf2ac4b1509 100644
--- a/Documentation/admin-guide/blockdev/nbd.rst
+++ b/Documentation/admin-guide/blockdev/nbd.rst
@@ -14,7 +14,7 @@ to borrow disk space from another computer.
 Unlike NFS, it is possible to put any filesystem on it, etc.

 For more information, or to download the nbd-client and nbd-server
-tools, go to http://nbd.sf.net/.
+tools, go to https://github.com/NetworkBlockDevice/nbd.

 The nbd kernel module need only be installed on the client
 system, as the nbd-server is completely in userspace. In fact,
-- 
2.39.2

