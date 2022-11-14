Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F16628CF2
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:02:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EF6EC20668; Mon, 14 Nov 2022 23:02:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:02:43 2022
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
	by bendel.debian.org (Postfix) with ESMTP id B489720616
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:02:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BZmk4rw3vXA0 for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:02:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id C689920545
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dSqAM4H/ZNj5Bd+6Dq49sMrpN7AEd4zkNtiLC0O8wQE=;
	b=MLR2llviRm5AAyofZ5+xe76o10g788KiB6sG62Nw6deuYbitEoFtSeAFyvfxAh5TGkUz24
	A6RHNlDQ2zP5yZmkepiXRR5atlWg4CBw1IJr/4P8BkzVH0H8IMwONigapcZI8a5D9JFLYi
	2IkWRmJocVfP+Ju2xxoNZuJQDtRakD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-FBTKseLZNtKTycP_74kR4w-1; Mon, 14 Nov 2022 17:46:59 -0500
X-MC-Unique: FBTKseLZNtKTycP_74kR4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C516685A5A6;
	Mon, 14 Nov 2022 22:46:58 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52B1C2024CC0;
	Mon, 14 Nov 2022 22:46:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 0/6] NBD spec changes for 64-bit extensions
Date: Mon, 14 Nov 2022 16:46:49 -0600
Message-Id: <20221114224655.2186173-1-eblake@redhat.com>
In-Reply-To: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4ebOlSU_3yC.A.lMD.TkscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2275
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224655.2186173-1-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:02:43 +0000 (UTC)

This is the NBD spec series; there are matching qemu and libnbd
patches that implement the changes in this series.  I'm happy to drop
the RFC patches from all three, but wanted the conversation on whether
it makes sense to have 64-bit holes during NBD_CMD_READ first (it
would make more sense if we had a way for a client and server to agree
on a single-transaction buffer limit much larger than 32M).

Eric Blake (6):
  spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS length
  spec: Tweak description of maximum block size
  spec: Add NBD_OPT_EXTENDED_HEADERS
  spec: Allow 64-bit block status results
  spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
  RFC: spec: Introduce NBD_REPLY_TYPE_OFFSET_HOLE_EXT

 doc/proto.md | 698 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 521 insertions(+), 177 deletions(-)

-- 
2.38.1

