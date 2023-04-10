Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBA66DCA5F
	for <lists+nbd@lfdr.de>; Mon, 10 Apr 2023 20:06:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 34B60207F9; Mon, 10 Apr 2023 18:06:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 10 18:06:42 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E4D74207F7
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Apr 2023 18:06:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Lg4qlB5jv930 for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Apr 2023 18:06:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 1190B20767
	for <nbd@other.debian.org>; Mon, 10 Apr 2023 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681149977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IT3jC7AVGFDWN5+2QSJmXDWRAxru1buk6lN5s+Jf7j4=;
	b=AqfVlM1IPup8NrL64qR0ipTsPHwCceJpYEtTbZP6qM+IIBwGBxQpc5MscdvMK1xnrAT0AD
	ANY3dkZpOV/mC17YL6gWfkzgp0qtfXACwP9rxgDaq8n1rE5L6T4VGBfEGIGITK4yAGcU85
	YcbIJFp0HCfJ+QtL9HiOcaDr/TD9UBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-Cs151I7pNJeGsXXn-R-o-A-1; Mon, 10 Apr 2023 14:06:13 -0400
X-MC-Unique: Cs151I7pNJeGsXXn-R-o-A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC8BA800B23;
	Mon, 10 Apr 2023 18:06:12 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02A04492C13;
	Mon, 10 Apr 2023 18:06:11 +0000 (UTC)
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
Subject: [PATCH v3 0/4] nbd: s/handle/cookie/
Date: Mon, 10 Apr 2023 13:06:07 -0500
Message-Id: <20230410180611.1051618-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7p5-nSoyxbK.A.T5B.yAFNkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2417
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230410180611.1051618-1-eblake@redhat.com
Resent-Date: Mon, 10 Apr 2023 18:06:42 +0000 (UTC)

v2 was here: https://lkml.org/lkml/2023/3/17/1107
since then:
- squash patch 2/5 and 3/5 into 3/4 [Ming]
- add Josef's R-b
- tweak commit messages to match commits in userspace NBD (code itself
  is unchanged, modulo the patch squash)

Eric Blake (4):
  uapi nbd: improve doc links to userspace spec
  uapi nbd: add cookie alias to handle
  block nbd: use req.cookie instead of req.handle
  docs nbd: userspace NBD now favors github over sourceforge

 Documentation/admin-guide/blockdev/nbd.rst |  2 +-
 drivers/block/nbd.c                        |  6 +++---
 include/uapi/linux/nbd.h                   | 25 +++++++++++++++++-----
 3 files changed, 24 insertions(+), 9 deletions(-)


base-commit: 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
-- 
2.39.2

