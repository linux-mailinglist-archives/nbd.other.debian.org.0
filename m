Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E737C9CF132
	for <lists+nbd@lfdr.de>; Fri, 15 Nov 2024 17:15:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C06E620CF4; Fri, 15 Nov 2024 16:15:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 15 16:15:37 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 98DEC20CD5
	for <lists-other-nbd@bendel.debian.org>; Fri, 15 Nov 2024 16:15:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.917 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VpT08VjMyeqs for <lists-other-nbd@bendel.debian.org>;
	Fri, 15 Nov 2024 16:15:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 482E520CE4
	for <nbd@other.debian.org>; Fri, 15 Nov 2024 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731687301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=miyu1cnSaJCJvT17HGrQe5RaBRja3jWYsTw+4Y3RWbg=;
	b=X2lrLsSUL4idSpxBV6vWwCNIVSFwEptysHSGSd30KqGStHed71ys/8503Yh1+9m2KhYqQC
	UdKsRs/xnHEjy22xdnKe4nWLNA1cm0akcI8jvX/yrXabhbDqVecafMZVMOm91edzXhu1FS
	A27TTDlfXYgDVyeDWny5XSyxzj1uWMs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-AUroYhlGPteRY2z9LWmzRg-1; Fri,
 15 Nov 2024 10:43:30 -0500
X-MC-Unique: AUroYhlGPteRY2z9LWmzRg-1
X-Mimecast-MFC-AGG-ID: AUroYhlGPteRY2z9LWmzRg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43EC51977323;
	Fri, 15 Nov 2024 15:43:29 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D927E19560A3;
	Fri, 15 Nov 2024 15:43:26 +0000 (UTC)
Date: Fri, 15 Nov 2024 09:43:24 -0600
From: Eric Blake <eblake@redhat.com>
To: linux-block@vger.kernel.org, nbd@other.debian.org, 
	Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: question on NBD idempotency
Message-ID: <2i75j4d6tt6aben6au4a3s63burx3kvtywhb3ecbh3w2eoallm@ye34afaah6ih>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20241002
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EQ7kXARZSwK.A.HTYE.pO3NnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3186
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2i75j4d6tt6aben6au4a3s63burx3kvtywhb3ecbh3w2eoallm@ye34afaah6ih
Resent-Date: Fri, 15 Nov 2024 16:15:37 +0000 (UTC)

I'm trying to develop a Kubernetes CSI driver that, among other
things, will be creating and tearing down NBD connections to other
hosts in the cluster, and am looking for idempotency design ideas.
Right now, when you call `nbd-client $host 10809`, nbd-client uses the
netlink interface to allocate an unused /dev/nbd$N device and outputs
the name of the device it created, then the userspace process exits
(unless TLS is in use, in which case the userspace sticks around to do
TLS translation of the TCP traffic into plaintext over Unix socketpair
to the kernel).  That means that any later `nbd-client -c /dev/nbd$N`
can output the pid of a process that no longer exists (or, less
likely, has been recycled into use by an unrelated process), making it
very difficult to have a race-free implementation that will be able to
look up which server(s) are currently in use by which NBD device(s),
since I can't use /proc/$pid/cmdline to see what server I originally
connected to.

In one direction, if I try to create an NBD device first and then
record the device name in a k8s CR, I run the risk that the CR update
fails.  A second attempt to `nbd-client $host 10809` will NOT report
that the server is already in use, but happily allocate yet another
device, so the only safe thing to do is if the attempt to record the
device name in a CR fails, I must immediately call `nbd-client -d
/dev/nbd$N` rather than use the first device, to avoid leaking it.

In the other direction, if I successfully record which /dev/nbd$N is
tied to a server after the device is created (and tear down the client
device if my recording is not successful), then I have a race in the
opposite direction: when I know it is time to clean up the device
because the server is going (or has already gone) away, if I try to
call `nbd-client -d /dev/nbd$N` more than once, I risk closing an
unrelated device on the second call if someone else allocated the same
id to an unrelated server in the meantime.  I have to be careful that
I don't clean up the device more than once, while still balancing
competing cleanups (cleaning up both my mapping and the client); I
shouldn't delete my mapping until I know the device is gone (so I
don't leak the device), but if cleaning up my mapping fails on the
first attempt and I need to retry it later, the second attempt should
not retry deleting the device.

It is possible to use `nbd-client -L $host $ip /dev/nbd$N` where _I_
manage the device numbers instead of letting netlink do
auto-allocation, but then I'm risking a race in the opposite
direction: if any other process in the system is also trying to
allocate NBD devices, the name I thought was unused when I called
nbd-client could end up already tied to a different server in parallel
by that other process, at which point I'm no longer guaranteed that
/dev/nbd$N is connected to the server I want.  So I really _do_ want
to use the netlink interface.

Is there an existing set of ioctls where the creation of an NBD device
could associate a user-space tag with the device, and I can then later
query the device to get the tag back?  A finite-length string would be
awesome (I could store "nbd://$ip:$port/$export" as the tag on
creation, to know precisely which server the device is talking to),
but even an integer tag (32- or 64-bit) might be enough (it's easier
to choose an integer tag in the full 2^64 namespace that is unlikely
to cause collisions with other processes on the system, than it is to
avoid collisions in the limited first few $N of the /dev/nbd$N device
names chosen to pick the lowest unused integer first).  If not, would
it be worth adding such ioctls for the NBD driver?

Usage-wise, I'm envisioning something like `nbd-client --tag $mytag
$host $ip` which creates the kernel device, associates the tag with
it, and outputs /dev/nbd$N on success; then later `nbd-client --tag -c
/dev/nbd$N` to output the tag name in addition to the originating pid
if the NBD device is still connected to the server.  Maybe even have a
way for `nbd-client --tag $tag -d /dev/nbd$N` which either atomically
succeeds (if the device indeed has that tag) or fails (if the tag does
not match what was already associated with the device).

But if there are no such ioctls (and no desire to accept a patch to
add them), then it looks like I _have_ to use /dev/nbd$N as the tag
that I map back to server details, and just be extremely careful in my
bookkeeping that I'm not racing in such a way that creates leaked
devices or which closes unintended devices, regardless of whether
there are secondary failures in trying to do the k8s bookkeeping to
track the mappings.  Ideas on how I can make this more robust would be
appreciated (for example, maybe it is more reliable to use symlinks in
the filesystem as my data store of mapped tags, than to try and
directly rely on k8s CR updates to synchronize).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


