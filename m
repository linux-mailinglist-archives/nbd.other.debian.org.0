Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E33E2D71
	for <lists+nbd@lfdr.de>; Fri,  6 Aug 2021 17:19:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 724FA20471; Fri,  6 Aug 2021 15:19:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  6 15:19:16 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3958B20612
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Aug 2021 15:01:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.355 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TXNFzghpKE6K for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Aug 2021 15:01:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 3AC30205BE
	for <nbd@other.debian.org>; Fri,  6 Aug 2021 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628262062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+yI0uptNoP6G4N0IJZFLL/DMeGNN+zepZ14xcoCNN6E=;
	b=fZSFCflwDRcq9bgBIu+OOaAkcVFFUWN/0V1bTpY/HhSARhrj02Sz1Sfstg3DQLlQgbiXED
	/ANGbwR9apCrOHv2hBLsSnQNkMAeuDoz7Ku7tJYWJFbZ3AEhpiFDHvoEz55mEz+3x+FuTH
	5AVYHrLXJzkVIoKwt9KZv/nI5a4DVRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-xKLAKPfBM76PMbAKYo_Dmg-1; Fri, 06 Aug 2021 10:29:38 -0400
X-MC-Unique: xKLAKPfBM76PMbAKYo_Dmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 376EA87D541;
	Fri,  6 Aug 2021 14:29:37 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.40.192.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52DD55DA61;
	Fri,  6 Aug 2021 14:29:20 +0000 (UTC)
From: pkalever@redhat.com
To: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	josef@toxicpanda.com,
	axboe@kernel.dk,
	idryomov@redhat.com,
	xiubli@redhat.com,
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Subject: [PATCH v1 0/2] nbd: reset the queue/io_timeout to default on disconnect
Date: Fri,  6 Aug 2021 19:59:12 +0530
Message-Id: <20210806142914.70556-1-pkalever@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qkdTWOOkG1I.A.QFH.0LVDhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1244
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210806142914.70556-1-pkalever@redhat.com
Resent-Date: Fri,  6 Aug 2021 15:19:16 +0000 (UTC)

From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>

Hi,

This series has changes to reset the queue/io_timeout for nbd devices and
a cleanup patch.

Thank you!

Prasanna Kumar Kalever (2):
  block: cleanup: define default command timeout and use it
  nbd: reset the queue/io_timeout to default on disconnect

 block/blk-mq.c         | 2 +-
 drivers/block/nbd.c    | 9 +++++++--
 include/linux/blkdev.h | 2 ++
 3 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.31.1

