Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D41304E5826
	for <lists+nbd@lfdr.de>; Wed, 23 Mar 2022 19:09:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BABA6203D8; Wed, 23 Mar 2022 18:09:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 23 18:09:22 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id ED7DB20300
	for <lists-other-nbd@bendel.debian.org>; Wed, 23 Mar 2022 18:09:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.705 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.517, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PAbmOBoncj8u for <lists-other-nbd@bendel.debian.org>;
	Wed, 23 Mar 2022 18:09:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B52EF2031E
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648058943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qtpo7h6RQ0M2Sode2qxavZ4yIDjrcynNWmWhqL2Sovo=;
	b=iLc6/XLYTFPvcsIrOlppDa2YUECFSbHyYegEKlpeCyR3i6uVBZVF3hpbIHRs6DiBwKCug+
	e0Xdx9vb5qCUXOfebFtCyVHgmawPJORBN1mUBzWta04HViLjPEoq4F3IAVVX/5+lGGoHJR
	XajSOnK67MIeQR/MjHd16Nll/jw9f4s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-34AHxO72PeWYsK_fw_UeaQ-1; Wed, 23 Mar 2022 14:09:02 -0400
X-MC-Unique: 34AHxO72PeWYsK_fw_UeaQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBADF3811A2F
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:09:01 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.12.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEF75401E58
	for <nbd@other.debian.org>; Wed, 23 Mar 2022 18:09:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH 0/3] Minor spec improvements
Date: Wed, 23 Mar 2022 13:08:58 -0500
Message-Id: <20220323180901.783198-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <N3cCLm2y0fM.A.QXG.SJ2OiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1748
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220323180901.783198-1-eblake@redhat.com
Resent-Date: Wed, 23 Mar 2022 18:09:22 +0000 (UTC)

Based on review from my last attempt at adding 64-bit extensions, I
split out the standalone doc cleanups first.  I'll probably push these
in a day or two, unless it gets reviewed earlier.

Eric Blake (3):
  docs: Clarify NBD_REPLY_TYPE_ERROR lengths
  docs: Clarify structured reads vs. block size constraints
  spec: Clarify BLOCK_STATUS reply details

 doc/proto.md | 52 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

-- 
2.35.1

