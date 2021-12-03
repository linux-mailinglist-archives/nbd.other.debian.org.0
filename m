Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C484680D5
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:44:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9CE7B20160; Fri,  3 Dec 2021 23:44:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:44:12 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,TO_TOO_MANY
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6C7B52014E
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:44:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ts15EdANa3oL for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:43:59 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 991F120139
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638575034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=oUWBWjJQ6f4K0WpqYUATM5jw6+bn9bfsKOi8oHqvMXs=;
	b=QXblr3BlIkz/aqE52tvtbm0DhXVBkpCd96WjTZX9hPpsQFkgOhreNEYMNSqX5xw5go+cjI
	CcUf9Km4CnjNJO90B73YJLG66otVmRXPtlsR2i0Eq9Hj0V4frWq4CGr7g3yoa7iegWdctC
	tLoqYmmrfVR5g1VjmVr6RC/6FrV1hmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-mB8c7q_CNFWc32G3GC4dig-1; Fri, 03 Dec 2021 18:13:23 -0500
X-MC-Unique: mB8c7q_CNFWc32G3GC4dig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3771A1808321;
	Fri,  3 Dec 2021 23:13:22 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A00AA60BE5;
	Fri,  3 Dec 2021 23:13:09 +0000 (UTC)
Date: Fri, 3 Dec 2021 17:13:07 -0600
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	vsementsov@virtuozzo.com, libguestfs@redhat.com, nsoffer@redhat.com
Subject: RFC for NBD protocol extension: extended headers
Message-ID: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20211029-46-a5fba3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nI15welCx7D.A.ugE.MvqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1645
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231307.wmtbw7r72tyzkkax@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:44:12 +0000 (UTC)

In response to this mail, I will be cross-posting a series of patches
to multiple projects as a proof-of-concept implementation and request
for comments on a new NBD protocol extension, called
NBD_OPT_EXTENDED_HEADERS.  With this in place, it will be possible for
clients to request 64-bit zero, trim, cache, and block status
operations when supported by the server.

Not yet complete: an implementation of this in nbdkit.  I also plan to
tweak libnbd's 'nbdinfo --map' and 'nbdcopy' to take advantage of the
larger block status results.  Also, with 64-bit commands, we may want
to also make it easier to let servers advertise an actual maximum size
they are willing to accept for the commands in question (for example,
a server may be happy with a full 64-bit block status, but still want
to limit non-fast zero and cache to a smaller limit to avoid denial of
service).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

