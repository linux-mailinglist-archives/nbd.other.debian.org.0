Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B993B2A3D04
	for <lists+nbd@lfdr.de>; Tue,  3 Nov 2020 07:52:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A0583206AD; Tue,  3 Nov 2020 06:52:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  3 06:52:27 2020
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A44EF20650
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Nov 2020 06:52:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id E5pFode1eqoc for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Nov 2020 06:52:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 5B85B20646
	for <nbd@other.debian.org>; Tue,  3 Nov 2020 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604386330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=TxH16j2Sw/5o2F1ItbgMRTL1aZhFHzPmNWeIsPnKHzA=;
	b=WQIa95Szihqmn9kv9RMhOuNrpcaJxMmn+WrJWxotnbZnMrQ6oNZp3LoD25Myh7MbvWkRYf
	SLKixBcf7xLSIJSyQ8E0Lp6EgOkwuCeqUP/b0PWa2D40yVrplMs0tOiKxcRKaW+m7ThBHA
	eN9rYuLJylB8LBBOIr850nNe0wX8m0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-0g2tCd2KM1-93-QC5PKCng-1; Tue, 03 Nov 2020 01:52:07 -0500
X-MC-Unique: 0g2tCd2KM1-93-QC5PKCng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A709D1084D62;
	Tue,  3 Nov 2020 06:52:06 +0000 (UTC)
Received: from lxbceph1.gsslab.pek2.redhat.com (vm37-120.gsslab.pek2.redhat.com [10.72.37.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DAE65D9DD;
	Tue,  3 Nov 2020 06:51:59 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	ming.lei@redhat.com
Cc: nbd@other.debian.org,
	linux-block@vger.kernel.org,
	jdillama@redhat.com,
	mgolub@suse.de,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH v3 0/2] nbd: fix use-after-freed and double lock bugs
Date: Tue,  3 Nov 2020 01:51:54 -0500
Message-Id: <20201103065156.342756-1-xiubli@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6MwdhQT0M1F.A.9KF.r4PofB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1032
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201103065156.342756-1-xiubli@redhat.com
Resent-Date: Tue,  3 Nov 2020 06:52:27 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

Changed in V3:
- remove the likely()

Changed in V2:
- fixed possible double lock issue in recv_work().

Xiubo Li (2):
  nbd: fix use-after-freed crash for nbd->recv_workq
  nbd: add comments about double lock for config_lock confusion

 drivers/block/nbd.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

-- 
2.18.4

