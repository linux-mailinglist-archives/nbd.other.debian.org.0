Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C853A9D30EA
	for <lists+nbd@lfdr.de>; Wed, 20 Nov 2024 00:31:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9BEAC2064F; Tue, 19 Nov 2024 23:31:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 23:31:22 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5719A20643
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2024 23:31:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.539 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JAobUfcGNoGq for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2024 23:31:08 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 8125020645
	for <nbd@other.debian.org>; Tue, 19 Nov 2024 23:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732059063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lcVJMOhZqY/JUtSLBT2fh36xCTTG/fMOI9BtMrUYabc=;
	b=h31JNkTk5tdMvz16PS9MtKoR+lfmC3gkbw4Sp8k1s5TgL7Lq8VBRrsosR4Clhc+wDWu2bd
	3A4XoDjdGOpXz4ths1xSuWRoN+9UlEwetTpjudVepMhDsM3Kjxc4sa1aSZvAX7Hnl+Icg5
	Pakgifrt+DFkET0NJtQ72DMgIr11+xI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-e8GFcIghOWK42VxQaMKKFQ-1; Tue,
 19 Nov 2024 18:31:02 -0500
X-MC-Unique: e8GFcIghOWK42VxQaMKKFQ-1
X-Mimecast-MFC-AGG-ID: e8GFcIghOWK42VxQaMKKFQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 760BD19560AF
	for <nbd@other.debian.org>; Tue, 19 Nov 2024 23:30:59 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.76])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C4501956086;
	Tue, 19 Nov 2024 23:30:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: stefanha@redhat.com
Subject: [PATCH 0/2] Add support for setting netlink backend string
Date: Tue, 19 Nov 2024 17:27:27 -0600
Message-ID: <20241119233057.2248038-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GjvmdtNxxv3RTxs6zwZ5CFmayeN-P8WRylysDx4bHFU_1732059059
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IfCWsLl5pE.A.2gIL.K_RPnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3191
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20241119233057.2248038-1-eblake@redhat.com
Resent-Date: Tue, 19 Nov 2024 23:31:22 +0000 (UTC)

Stefan Hajnoczi pointed out to me that since kernel 5.14 (commit
6497ef8d in Apr 2021), the netlink interface has allowed userspace to
pass in an arbitrary backend string visible at
/sys/block/nbdN/backend, and which prevents the abuse of netlink to
arbitrarily reconfigure an active NBD connection to a different
backend, for some added safety when multiple threads might be racing
to create NBD devices.  Time to expose it in nbd-client, along with
first fixing some regressions along the way.

Eric Blake (2):
  nbd-client: Fix use without -N
  nbd-client: Add support for setting /sys/block/nbdN/backend

 .gitignore               |  1 +
 man/nbd-client.8.sgml.in | 24 +++++++++++++++++++++++-
 nbd-client.c             | 30 ++++++++++++++++++++++++------
 nbd-netlink.h            |  7 +++++--
 4 files changed, 53 insertions(+), 9 deletions(-)

-- 
2.47.0

