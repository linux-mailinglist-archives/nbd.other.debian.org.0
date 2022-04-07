Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6FA4F88E3
	for <lists+nbd@lfdr.de>; Thu,  7 Apr 2022 23:37:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A578D2043B; Thu,  7 Apr 2022 21:37:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr  7 21:37:40 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DA4C4203AC
	for <lists-other-nbd@bendel.debian.org>; Thu,  7 Apr 2022 21:37:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.889 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rwhDWJ30g8UL for <lists-other-nbd@bendel.debian.org>;
	Thu,  7 Apr 2022 21:37:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 01F312034F
	for <nbd@other.debian.org>; Thu,  7 Apr 2022 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649367443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yOLh93foW/mewJObGoSjq7jxjs3ktj61CzC2vgFNMKY=;
	b=IZ6fVi3GgDm9K0R2UslnTDd1oMLaJE31d7qExxkcR3S0hjwYHHDMQZlsY8kONy3Yz9Gh7o
	9Z+7a0SzzAwq5T9gHUmiGuWCmZq81N7KOp0Dq1eAJZBvZYHVVVeLyDDxVOkyECZQ64jw3/
	NFj08WBWfq1kQE0Dqckc7mLgcum4xWM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-jXpJDYrJPDSAZV88Ct1WUQ-1; Thu, 07 Apr 2022 17:37:21 -0400
X-MC-Unique: jXpJDYrJPDSAZV88Ct1WUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A8FE296A638;
	Thu,  7 Apr 2022 21:37:21 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0273C40CFD06;
	Thu,  7 Apr 2022 21:37:20 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com,
	qemu-block@nongnu.org,
	v.sementsov-og@mail.ru
Subject: [PATCH 0/2] More NBD spec prep-work before 64-bit headers
Date: Thu,  7 Apr 2022 16:37:18 -0500
Message-Id: <20220407213720.250252-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <T7UuK6KgzwP.A.dUD.km1TiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1920
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220407213720.250252-1-eblake@redhat.com
Resent-Date: Thu,  7 Apr 2022 21:37:40 +0000 (UTC)

In implementing my proof-of-concept 64-bit headers, I found the
following spec changes to be independent enough to post for review
now.

Eric Blake (2):
  spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS length
  spec: Tweak description of maximum block size

 doc/proto.md | 87 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 34 deletions(-)

-- 
2.35.1

