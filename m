Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371A388929
	for <lists+nbd@lfdr.de>; Wed, 19 May 2021 10:12:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2987B20A78; Wed, 19 May 2021 08:12:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 19 08:12:10 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DAD5E20A73
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 May 2021 07:54:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.779 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WK6Upg0l7Aw3 for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 May 2021 07:54:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 26C7220A71
	for <nbd@other.debian.org>; Wed, 19 May 2021 07:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621410878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYFydkW4BqXlHKa4p4FwrA6eAmuVAjJCF7Qyahr9GmY=;
	b=QJEW4L4pOyvtNQzwvW/AHhCh9pN8z9Fg2PHTkWZuovRvsWbF75uLN01trdOZuGDnHCTuf/
	14ExfI2lAuuD6KfM0CfYdezJI8Xalb5Xx85rv6VDOwBzYQQ0yPOVEOPk0V0+fycTg1F27s
	jOhpDhcDZz2C76NFSAZPHtPdnFOapec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-MMVt3iRcPgis97wVaVfnyQ-1; Wed, 19 May 2021 03:54:36 -0400
X-MC-Unique: MMVt3iRcPgis97wVaVfnyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36A5D800D62;
	Wed, 19 May 2021 07:54:35 +0000 (UTC)
Received: from T590 (ovpn-12-143.pek2.redhat.com [10.72.12.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA95D2ED6C;
	Wed, 19 May 2021 07:54:23 +0000 (UTC)
Date: Wed, 19 May 2021 15:54:18 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Prasanna Kalever <pkalever@redhat.com>
Cc: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, Josef Bacik <josef@toxicpanda.com>,
	axboe@kernel.dk, Ilya Dryomov <idryomov@redhat.com>,
	Xiubo Li <xiubli@redhat.com>,
	Matteo Croce <mcroce@linux.microsoft.com>
Subject: Re: [PATCH] nbd: provide a way for userspace processes to identify
 device backends
Message-ID: <YKTEKmDdKZKTMKYS@T590>
References: <20210429102828.31248-1-prasanna.kalever@redhat.com>
 <YKMKdHPFCNhR1SXx@T590>
 <CANwsLLH0HyZ-VGPMc+VmuLivG1fiZHnSqUyLx3UWb76ZMCgYSg@mail.gmail.com>
 <YKOHuNd0Kp+lcQHY@T590>
 <CANwsLLE6FK3eCmDwQ+7ghwFx0Hi1KDr6TaiKX1VW2Yt+5xe+WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANwsLLE6FK3eCmDwQ+7ghwFx0Hi1KDr6TaiKX1VW2Yt+5xe+WA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <m94jaJ8gkGM.A.4dE.ahMpgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1164
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YKTEKmDdKZKTMKYS@T590
Resent-Date: Wed, 19 May 2021 08:12:10 +0000 (UTC)

On Tue, May 18, 2021 at 03:19:37PM +0530, Prasanna Kalever wrote:
> On Tue, May 18, 2021 at 2:54 PM Ming Lei <ming.lei@redhat.com> wrote:
> >
> > On Tue, May 18, 2021 at 01:22:19PM +0530, Prasanna Kalever wrote:
> > > On Tue, May 18, 2021 at 6:00 AM Ming Lei <ming.lei@redhat.com> wrote:
> > > >
> > > > Hello Prasanna,
> > > >
> > > > On Thu, Apr 29, 2021 at 03:58:28PM +0530, Prasanna Kumar Kalever wrote:
> > > > > Problem:
> > > > > On reconfigure of device, there is no way to defend if the backend
> > > > > storage is matching with the initial backend storage.
> > > > >
> > > > > Say, if an initial connect request for backend "pool1/image1" got
> > > > > mapped to /dev/nbd0 and the userspace process is terminated. A next
> > > > > reconfigure request within NBD_ATTR_DEAD_CONN_TIMEOUT is allowed to
> > > > > use /dev/nbd0 for a different backend "pool1/image2"
> > > > >
> > > > > For example, an operation like below could be dangerous:
> > > >
> > >
> > > Hello Ming,
> > >
> > > > Can you explain a bit why it is dangerous?
> > >
> > > Yes, sure. Please check the below comments inline,
> > >
> > > >
> > > > >
> > > > > $ sudo rbd-nbd map --try-netlink rbd-pool/ext4-image
> > > > > /dev/nbd0
> > > > > $ sudo blkid /dev/nbd0
> > > > > /dev/nbd0: UUID="bfc444b4-64b1-418f-8b36-6e0d170cfc04" TYPE="ext4"
> > >
> > > On Map the rbd-nbd attempting to send NBD_CMD_CONNECT, for backend
> > > 'rbd-pool/ext4-image'. Post which kernel will allocate a new device
> > > say /dev/nbd0 for backend file rbd-pool/ext4-image (format:
> > > <pool>/<backendfile>)
> > >
> > > > > $ sudo pkill -9 rbd-nbd
> > >
> > > Assume normally or abnormally the userspace process (rbd-nbd here) is
> > > terminated, but then as per the settings the device /dev/nbd0 is not
> > > returned immediately, the kernel will wait for the
> > > NBD_ATTR_DEAD_CONN_TIMEOUT to expire.
> > >
> > > At this point two things could be possible:
> > > 1. if there is a reconfigure request from userspace within the timeout
> > > then the kernel might reassign the same device /dev/nbd0.
> > > 2. if the timeout has expired, then the device will be relieved.
> > >
> > > > > $ sudo rbd-nbd attach --try-netlink --device /dev/nbd0 rbd-pool/xfs-image
> > > > > /dev/nbd0
> > > > > $ sudo blkid /dev/nbd0
> > > > > /dev/nbd0: UUID="d29bf343-6570-4069-a9ea-2fa156ced908" TYPE="xfs"
> > >
> > > On attach the rbd-nbd attempt to send NBD_CMD_RECONFIGURE, after which
> > > the kernel will assign '--device /dev/nbd0' to specified backend.
> > >
> > > But there is a chance that userspace processes might accidentally send
> > > NBD_CMD_RECONFIGURE claiming for /dev/nbd0 for a different backend
> > > (rbd-pool/xfs-image instead of original rbd-pool/ext4-image).
> > > Currently, there is no mechanism to verify if the backend provided
> > > later with attach(NBD_CMD_RECONFIGURE) is matching with the one
> > > provided originally with map(NBD_CMD_CONNECT) before granting for a
> > > attach or reconfigure.
> > >
> > > For example in the above-explained scenario:
> > > Assume EXT4 on rbd-pool/ext4-image was mounted, after attach (Note:
> > > device /dev/nbd0 is reconfigured to a different backend file) XFS on
> > > rbd-pool/xfs-image would get corrupted. If there was an application
> > > using /dev/nbd0 directly (as a raw block volume), it wouldn't be happy
> > > either.
> >
> > OK, got it. If I understand correctly, what you need is to not allow
> > reconfigure if the nbd disk is mounted, right?
> 
> Excuse me, not exactly. Mount was one example scenario to showcase why
> allowing attaching without any validation could be dangerous.

If nbd has exclusive owner, it shouldn't be reconfigured, which
can be respected in kernel side only, see loop_configure().

Not all application can provide NBD_ATTR_BACKEND_IDENTIFIER, so
claiming in nbd_genl_reconfigure() is still needed, IMO.

> Basically, we want a way to check and verify if the backend specified
> at map time and backend specified at attach(reconfigure) time are
> matching for a given device, only if they are matching proceed to
> attach else fail.
> 
> >
> > >
> > > > >
> > > > > Solution:
> > > > > Provide a way for userspace processes to keep some metadata to identify
> > > > > between the device and the backend, so that when a reconfigure request is
> > > > > made, we can compare and avoid such dangerous operations.
> > > > >
> > > > > With this solution, as part of the initial connect request, backend
> > > > > path can be stored in the sysfs per device config, so that on a reconfigure
> > > > > request it's easy to check if the backend path matches with the initial
> > > > > connect backend path.
> > > > >
> > > > > Please note, ioctl interface to nbd will not have these changes, as there
> > > > > won't be any reconfigure.
> > > >
> > > > BTW, loop has similar issue, and patch of 'block: add a sequence number to disks'
> > > > is added for addressing this issue, what do you think of that generic
> > > > approach wrt. this nbd's issue? such as used the exposed sysfs sequence number
> > > > for addressing this issue?
> > > >
> > > > https://lore.kernel.org/linux-block/YH81n34d2G3C4Re+@gardel-login/#r
> > >
> > > If I understand the changes and the background of the fix correctly, I
> > > think with that fix author is trying to monotonically increase the seq
> > > number and add it to the disk on every single device map/attach and
> > > expose it through the sysfs, which will help the userspace processes
> > > further to correlate events for particular and specific devices that
> > > reuse the same loop device.
> > >
> > > Coming back to my changes:
> > > I think here with this fix, we are trying to solve a different
> > > problem. The fix with this patch accepts a cookie or a backend string
> > > (could be file-path or whatever id userspace choose to provide) from
> > > userspace at the time of map and stores it in the sysfs
> > > /sys/block/nbdX/backend path and persists it until unmap is issued on
> > > the device (meaning that identity stays throughout the life cycle of
> > > that device, no matter how many detach and attaches happen).
> >
> > Your solution needs change from userspace side, so it isn't flexible.
> >
> > > If there
> > > is a detach request in between (not unmap) then on the next attach
> > > (reconfigure request to reuse the same device) the stored
> > > cookie/UUID/backend-string will stand as a reference to verify if the
> > > newly passed backend is matching with the actual backend passed at map
> > > time to avoid any misconfigurations by accident and to safely proceed
> > > with attach.
> >
> > We can avoid reconfigure if the nbd disk is opened exclusively, such as
> > mount, please see if the following patch can solve your problem:
> 
> IMHO, we should almost never allow reconfigure/reattaching a given
> device with a different backend (except in cases like live migration,
> which the application should take care of), and not just when nbd disk
> is opened exclusively.
> 
> When an attach (reconfigure) is issued, Its application's logic to
> provide the same matching cookie (or device-string or a uuid) so that
> kernel can validate it with /sys/block/nbdX/backend and continue
> safely to attach and reassign the device back.

Your patch looks fine, but only new application can benefit from it, and
we still need to avoid reconfigure if the disk is opened exclusively for
old applications. Anyway:

Reviewed-by: Ming Lei <ming.lei@redhat.com>



Thanks,
Ming

