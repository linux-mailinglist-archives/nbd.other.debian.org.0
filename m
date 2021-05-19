Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D6E3890FF
	for <lists+nbd@lfdr.de>; Wed, 19 May 2021 16:33:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 227EA20BCA; Wed, 19 May 2021 14:33:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 19 14:33:10 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A272220BBB
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 May 2021 14:17:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.779 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id f8ZkVYkTzn5N for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 May 2021 14:17:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 33B4520BB1
	for <nbd@other.debian.org>; Wed, 19 May 2021 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621433859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icJcCqfGBMIKdg56kl8nkfi2ldLxVscbkDP3FGXCv8k=;
	b=O3vvFz256HD8c+bQDSvq4ayZpBRLgJJEW9PwxIGvnyuBK3RlbcGkS8vU/fVRNr/POyjXpG
	ClLt13GobijAfRfNCrPbWQkhqUUqEIM+WgOUbkzSRsJZ4PY7TEacmhQJd/2J2u0vbP8BgJ
	/YkTA1Osee7aOyT5vQRjD1S5RnuR8pI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-tZzWq2ZkOqOSHzONwxqOqA-1; Wed, 19 May 2021 10:17:37 -0400
X-MC-Unique: tZzWq2ZkOqOSHzONwxqOqA-1
Received: by mail-wm1-f70.google.com with SMTP id b206-20020a1c1bd70000b02901713122405eso745791wmb.1
        for <nbd@other.debian.org>; Wed, 19 May 2021 07:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=icJcCqfGBMIKdg56kl8nkfi2ldLxVscbkDP3FGXCv8k=;
        b=CDX5jiH+phLu2Hh18gNuCZtBFyAg4l9KztkO0sTg2DN+H+Do3D/avohsPwUcspJFDi
         J+e0Ttt2GDFctu2EN9fUOnpwf1jAs6osXLMI+deOUHqB5viZypYwcxTvP5hOCYm62/u9
         LAplCVIX55tYv9Ju6BPEkjyhON8MCZY3NKzCymDK5U8Tm1GQlskeb8HkqabSXOmg6uJp
         lYjbVzqDve0pALvYJRkxLu5ETTIXxnDWFIlYYhIkGfZujl1lDOGa2vpkjKv1yM1Wt2gC
         A0ryy59SJpCm7o8u1pELWtPEkchUKy89ehg7mQGGPVmXhj+UtRfXRyH0QRU1//7laEU7
         ygjw==
X-Gm-Message-State: AOAM530+qrFwMa+l6dcdCxWgwFf8zygiIDkrUbvpzbzXMDEcVEucjctZ
	rhamC2cv3XNGJUw+iCaXhgJHRSMWUcaOP9NcYVmOWB1LwE6nfju6HKXJBy4l67zPZ3C/H+0Vtfm
	0YiOoK3ZNL6E3ZZj0E+SyBoqJMCe/9g==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr11823460wmb.53.1621433855691;
        Wed, 19 May 2021 07:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUYw+dNhR/wi0zmm1gNhT045SZTpfUQacgFY4wE2XnTZuSC/xawairjyUH3JZ3eNVy8wdsCTxcsaA73SyGJSo=
X-Received: by 2002:a1c:f012:: with SMTP id a18mr11823425wmb.53.1621433855316;
 Wed, 19 May 2021 07:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210429102828.31248-1-prasanna.kalever@redhat.com>
 <YKMKdHPFCNhR1SXx@T590> <CANwsLLH0HyZ-VGPMc+VmuLivG1fiZHnSqUyLx3UWb76ZMCgYSg@mail.gmail.com>
 <YKOHuNd0Kp+lcQHY@T590> <CANwsLLE6FK3eCmDwQ+7ghwFx0Hi1KDr6TaiKX1VW2Yt+5xe+WA@mail.gmail.com>
 <YKTEKmDdKZKTMKYS@T590>
In-Reply-To: <YKTEKmDdKZKTMKYS@T590>
From: Prasanna Kalever <pkalever@redhat.com>
Date: Wed, 19 May 2021 19:47:24 +0530
Message-ID: <CANwsLLHqtEGVJO5Ow92OjPm8oDnFRegWv2UfaunXtKVzZ6481g@mail.gmail.com>
Subject: Re: [PATCH] nbd: provide a way for userspace processes to identify
 device backends
To: Ming Lei <ming.lei@redhat.com>
Cc: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk, Ilya Dryomov <idryomov@redhat.com>, 
	Xiubo Li <xiubli@redhat.com>, Matteo Croce <mcroce@linux.microsoft.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkalever@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3gyZuVGQCfM.A.HPC.mGSpgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1165
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANwsLLHqtEGVJO5Ow92OjPm8oDnFRegWv2UfaunXtKVzZ6481g@mail.gmail.com
Resent-Date: Wed, 19 May 2021 14:33:10 +0000 (UTC)

On Wed, May 19, 2021 at 1:24 PM Ming Lei <ming.lei@redhat.com> wrote:
>
> On Tue, May 18, 2021 at 03:19:37PM +0530, Prasanna Kalever wrote:
> > On Tue, May 18, 2021 at 2:54 PM Ming Lei <ming.lei@redhat.com> wrote:
> > >
> > > On Tue, May 18, 2021 at 01:22:19PM +0530, Prasanna Kalever wrote:
> > > > On Tue, May 18, 2021 at 6:00 AM Ming Lei <ming.lei@redhat.com> wrote:
> > > > >
> > > > > Hello Prasanna,
> > > > >
> > > > > On Thu, Apr 29, 2021 at 03:58:28PM +0530, Prasanna Kumar Kalever wrote:
> > > > > > Problem:
> > > > > > On reconfigure of device, there is no way to defend if the backend
> > > > > > storage is matching with the initial backend storage.
> > > > > >
> > > > > > Say, if an initial connect request for backend "pool1/image1" got
> > > > > > mapped to /dev/nbd0 and the userspace process is terminated. A next
> > > > > > reconfigure request within NBD_ATTR_DEAD_CONN_TIMEOUT is allowed to
> > > > > > use /dev/nbd0 for a different backend "pool1/image2"
> > > > > >
> > > > > > For example, an operation like below could be dangerous:
> > > > >
> > > >
> > > > Hello Ming,
> > > >
> > > > > Can you explain a bit why it is dangerous?
> > > >
> > > > Yes, sure. Please check the below comments inline,
> > > >
> > > > >
> > > > > >
> > > > > > $ sudo rbd-nbd map --try-netlink rbd-pool/ext4-image
> > > > > > /dev/nbd0
> > > > > > $ sudo blkid /dev/nbd0
> > > > > > /dev/nbd0: UUID="bfc444b4-64b1-418f-8b36-6e0d170cfc04" TYPE="ext4"
> > > >
> > > > On Map the rbd-nbd attempting to send NBD_CMD_CONNECT, for backend
> > > > 'rbd-pool/ext4-image'. Post which kernel will allocate a new device
> > > > say /dev/nbd0 for backend file rbd-pool/ext4-image (format:
> > > > <pool>/<backendfile>)
> > > >
> > > > > > $ sudo pkill -9 rbd-nbd
> > > >
> > > > Assume normally or abnormally the userspace process (rbd-nbd here) is
> > > > terminated, but then as per the settings the device /dev/nbd0 is not
> > > > returned immediately, the kernel will wait for the
> > > > NBD_ATTR_DEAD_CONN_TIMEOUT to expire.
> > > >
> > > > At this point two things could be possible:
> > > > 1. if there is a reconfigure request from userspace within the timeout
> > > > then the kernel might reassign the same device /dev/nbd0.
> > > > 2. if the timeout has expired, then the device will be relieved.
> > > >
> > > > > > $ sudo rbd-nbd attach --try-netlink --device /dev/nbd0 rbd-pool/xfs-image
> > > > > > /dev/nbd0
> > > > > > $ sudo blkid /dev/nbd0
> > > > > > /dev/nbd0: UUID="d29bf343-6570-4069-a9ea-2fa156ced908" TYPE="xfs"
> > > >
> > > > On attach the rbd-nbd attempt to send NBD_CMD_RECONFIGURE, after which
> > > > the kernel will assign '--device /dev/nbd0' to specified backend.
> > > >
> > > > But there is a chance that userspace processes might accidentally send
> > > > NBD_CMD_RECONFIGURE claiming for /dev/nbd0 for a different backend
> > > > (rbd-pool/xfs-image instead of original rbd-pool/ext4-image).
> > > > Currently, there is no mechanism to verify if the backend provided
> > > > later with attach(NBD_CMD_RECONFIGURE) is matching with the one
> > > > provided originally with map(NBD_CMD_CONNECT) before granting for a
> > > > attach or reconfigure.
> > > >
> > > > For example in the above-explained scenario:
> > > > Assume EXT4 on rbd-pool/ext4-image was mounted, after attach (Note:
> > > > device /dev/nbd0 is reconfigured to a different backend file) XFS on
> > > > rbd-pool/xfs-image would get corrupted. If there was an application
> > > > using /dev/nbd0 directly (as a raw block volume), it wouldn't be happy
> > > > either.
> > >
> > > OK, got it. If I understand correctly, what you need is to not allow
> > > reconfigure if the nbd disk is mounted, right?
> >
> > Excuse me, not exactly. Mount was one example scenario to showcase why
> > allowing attaching without any validation could be dangerous.
>
> If nbd has exclusive owner, it shouldn't be reconfigured, which
> can be respected in kernel side only, see loop_configure().
>
> Not all application can provide NBD_ATTR_BACKEND_IDENTIFIER, so
> claiming in nbd_genl_reconfigure() is still needed, IMO.
>
> > Basically, we want a way to check and verify if the backend specified
> > at map time and backend specified at attach(reconfigure) time are
> > matching for a given device, only if they are matching proceed to
> > attach else fail.
> >
> > >
> > > >
> > > > > >
> > > > > > Solution:
> > > > > > Provide a way for userspace processes to keep some metadata to identify
> > > > > > between the device and the backend, so that when a reconfigure request is
> > > > > > made, we can compare and avoid such dangerous operations.
> > > > > >
> > > > > > With this solution, as part of the initial connect request, backend
> > > > > > path can be stored in the sysfs per device config, so that on a reconfigure
> > > > > > request it's easy to check if the backend path matches with the initial
> > > > > > connect backend path.
> > > > > >
> > > > > > Please note, ioctl interface to nbd will not have these changes, as there
> > > > > > won't be any reconfigure.
> > > > >
> > > > > BTW, loop has similar issue, and patch of 'block: add a sequence number to disks'
> > > > > is added for addressing this issue, what do you think of that generic
> > > > > approach wrt. this nbd's issue? such as used the exposed sysfs sequence number
> > > > > for addressing this issue?
> > > > >
> > > > > https://lore.kernel.org/linux-block/YH81n34d2G3C4Re+@gardel-login/#r
> > > >
> > > > If I understand the changes and the background of the fix correctly, I
> > > > think with that fix author is trying to monotonically increase the seq
> > > > number and add it to the disk on every single device map/attach and
> > > > expose it through the sysfs, which will help the userspace processes
> > > > further to correlate events for particular and specific devices that
> > > > reuse the same loop device.
> > > >
> > > > Coming back to my changes:
> > > > I think here with this fix, we are trying to solve a different
> > > > problem. The fix with this patch accepts a cookie or a backend string
> > > > (could be file-path or whatever id userspace choose to provide) from
> > > > userspace at the time of map and stores it in the sysfs
> > > > /sys/block/nbdX/backend path and persists it until unmap is issued on
> > > > the device (meaning that identity stays throughout the life cycle of
> > > > that device, no matter how many detach and attaches happen).
> > >
> > > Your solution needs change from userspace side, so it isn't flexible.
> > >
> > > > If there
> > > > is a detach request in between (not unmap) then on the next attach
> > > > (reconfigure request to reuse the same device) the stored
> > > > cookie/UUID/backend-string will stand as a reference to verify if the
> > > > newly passed backend is matching with the actual backend passed at map
> > > > time to avoid any misconfigurations by accident and to safely proceed
> > > > with attach.
> > >
> > > We can avoid reconfigure if the nbd disk is opened exclusively, such as
> > > mount, please see if the following patch can solve your problem:
> >
> > IMHO, we should almost never allow reconfigure/reattaching a given
> > device with a different backend (except in cases like live migration,
> > which the application should take care of), and not just when nbd disk
> > is opened exclusively.
> >
> > When an attach (reconfigure) is issued, Its application's logic to
> > provide the same matching cookie (or device-string or a uuid) so that
> > kernel can validate it with /sys/block/nbdX/backend and continue
> > safely to attach and reassign the device back.
>
> Your patch looks fine, but only new application can benefit from it, and
> we still need to avoid reconfigure if the disk is opened exclusively for
> old applications. Anyway:

Right applications adopting NBD_ATTR_BACKEND_IDENTIFIER will only get
benefited from these changes.
We could make it strict on the kernel side asking for a cookie but
that will break the existing users.

Here is one good example where we need to allow reconfigure when the
disk is opened exclusively:
Assume your nbd client process (rbd-nbd) is running in a server
container and the application is running in a different
container(which benefits from mount). During server upgrades, we need
to restart the server containers, which means the rbd-nbd process will
also be terminated and later rbd-nbd process need to brought back to
life where it should clam the same device with NBD_CMD_RECONFIGURE,
all this happening while the IO is ongoing on the mount point, in this
cases we need to allow reconfigure even when the disk is opened
exclusively.

Not just the upgrades there are many practical cases where restart of
the server container is done.

>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>

Many thanks for your review.

BRs,
--
Prasanna

>
>
>
> Thanks,
> Ming
>

