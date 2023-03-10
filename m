Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A006B5197
	for <lists+nbd@lfdr.de>; Fri, 10 Mar 2023 21:16:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BD82C20778; Fri, 10 Mar 2023 20:16:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 10 20:16:04 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0D1B720777
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Mar 2023 20:15:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SHVHcS8WAqkA for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Mar 2023 20:15:38 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 2A52020779
	for <nbd@other.debian.org>; Fri, 10 Mar 2023 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678479333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hnVD7krrqQ4+GWMqPVcp+YfvImsOsWxKBMH5y3xz1f0=;
	b=LlJUSvml86ILjhXIZ49GeY9Bx9GXOZRY6+3y1xRXRWyx93ZeUY0dUODiBhwthhUqaKOhGN
	FlBxolr7oKmobiz1r1xC2+RQPuR1oEvgTsQGmLhxt/a3lmE95JvUXU/F7XKBjb6xsPsVTg
	7UV/o+ZuzRI/Zgj2sXLsff7GKjT1r74=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-HfmnwJteMI691XAYC91cyg-1; Fri, 10 Mar 2023 15:15:27 -0500
X-MC-Unique: HfmnwJteMI691XAYC91cyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 010283C0E463;
	Fri, 10 Mar 2023 20:15:27 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A85E40BC781;
	Fri, 10 Mar 2023 20:15:26 +0000 (UTC)
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
Subject: [PATCH 0/3] nbd: s/handle/cookie/
Date: Fri, 10 Mar 2023 14:15:22 -0600
Message-Id: <20230310201525.2615385-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <N6BCYZdEoGH.A.D3B.EA5CkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2371
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230310201525.2615385-1-eblake@redhat.com
Resent-Date: Fri, 10 Mar 2023 20:16:04 +0000 (UTC)

A 64-bit integer is easier to deal with than char[8], and has no
difference over the wire.  This series stems from a review of a patch
I first submitted to the userspace NBD documentation:

https://lists.debian.org/nbd/2023/03/msg00031.html

Eric Blake (3):
  uapi nbd: improve doc links to userspace spec
  uapi nbd: add cookie alias to handle
  block nbd: use req.cookie instead of req.handle

 Documentation/admin-guide/blockdev/nbd.rst |  2 +-
 drivers/block/nbd.c                        |  4 ++--
 include/uapi/linux/nbd.h                   | 25 +++++++++++++++++-----
 3 files changed, 23 insertions(+), 8 deletions(-)

-- 
2.39.2

