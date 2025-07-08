Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 403A6AFC490
	for <lists+nbd@lfdr.de>; Tue,  8 Jul 2025 09:51:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1D4A6205B4; Tue,  8 Jul 2025 07:51:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  8 07:51:15 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6289F20479
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Jul 2025 07:34:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.503 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, CC_TOO_MANY=3,
	DKIMWL_WL_HIGH=-2.907, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z48ZRxguMW3n for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Jul 2025 07:34:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id C118A204CD
	for <nbd@other.debian.org>; Tue,  8 Jul 2025 07:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751960062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yyrOa/0bHa3VwV4PjrNhK+4OqEjCqXn7aozO5QOaBAM=;
	b=SaojuR+X+2MymOIxJ6vvdLxDrQ2YzX5XNSVrhsNW6OtiBXzRp9jR1/BsXJyrStCtoCCn+3
	125CN3m+Ll/0Z416XAg0DgBnT+XwojfJywhT3xbk8I0svVOG58njfj/EBFrgZ9M205cnfv
	n7akL2e0EjSD0SR2hZIzhpY9vnTekIg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-5WTsIdcCNDKNx9rh_kkX_Q-1; Tue,
 08 Jul 2025 03:34:19 -0400
X-MC-Unique: 5WTsIdcCNDKNx9rh_kkX_Q-1
X-Mimecast-MFC-AGG-ID: 5WTsIdcCNDKNx9rh_kkX_Q_1751960057
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53E84180136B;
	Tue,  8 Jul 2025 07:34:15 +0000 (UTC)
Received: from fedora (unknown [10.72.116.64])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0428C30001B1;
	Tue,  8 Jul 2025 07:34:06 +0000 (UTC)
Date: Tue, 8 Jul 2025 15:34:01 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, josef@toxicpanda.com,
	axboe@kernel.dk, hch@infradead.org, hare@suse.de,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com, johnny.chenyi@huawei.com,
	"yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH] nbd: fix false lockdep deadlock warning
Message-ID: <aGzJ6dssrCmJtG-3@fedora>
References: <20250627092348.1527323-1-yukuai1@huaweicloud.com>
 <aF56oVEzTygIOUTN@fedora>
 <c2fbaacc-62a1-4a98-4157-2637b7f242b7@huaweicloud.com>
 <197b6dca-56be-438d-a60f-21011367c5ed@linux.ibm.com>
 <99b4afce-de05-ddcb-2634-b19214cf4534@huaweicloud.com>
 <aGSaVhiH2DeTvtdr@fedora>
 <7b09167f-bf8d-4d94-9317-3cfbb4f83cd8@linux.ibm.com>
 <bc3f20c3-21f8-443b-619f-da7569b37aaf@huaweicloud.com>
 <08ce91d9-756a-a8fa-a988-a13ec74d8c1c@huaweicloud.com>
 <91174432-8c70-437f-811f-7c8a6c028f64@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91174432-8c70-437f-811f-7c8a6c028f64@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Q9eMR3QComC.A._MGM.z3MboB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3414
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aGzJ6dssrCmJtG-3@fedora
Resent-Date: Tue,  8 Jul 2025 07:51:15 +0000 (UTC)

On Tue, Jul 08, 2025 at 10:42:00AM +0530, Nilay Shroff wrote:
> 
> 
> On 7/5/25 6:45 AM, Yu Kuai wrote:
> > Hi,
> > 
> > 在 2025/07/02 15:30, Yu Kuai 写道:
> >> Hi,
> >>
> >> 在 2025/07/02 14:22, Nilay Shroff 写道:
> >>>
> >>>
> >>> On 7/2/25 8:02 AM, Ming Lei wrote:
> >>>> On Wed, Jul 02, 2025 at 09:12:09AM +0800, Yu Kuai wrote:
> >>>>> Hi,
> >>>>>
> >>>>> 在 2025/07/01 21:28, Nilay Shroff 写道:
> >>>>>>
> >>>>>>
> >>>>>> On 6/28/25 6:18 AM, Yu Kuai wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> 在 2025/06/27 19:04, Ming Lei 写道:
> >>>>>>>> I guess the patch in the following link may be simper, both two take
> >>>>>>>> similar approach:
> >>>>>>>>
> >>>>>>>> https://lore.kernel.org/linux-block/aFjbavzLAFO0Q7n1@fedora/
> >>>>>>>
> >>>>>>> I this the above approach has concurrent problems if nbd_start_device
> >>>>>>> concurrent with nbd_start_device:
> >>>>>>>
> >>>>>>> t1:
> >>>>>>> nbd_start_device
> >>>>>>> lock
> >>>>>>> num_connections = 1
> >>>>>>> unlock
> >>>>>>>       t2:
> >>>>>>>       nbd_add_socket
> >>>>>>>       lock
> >>>>>>>       config->num_connections++
> >>>>>>>       unlock
> >>>>>>>           t3:
> >>>>>>>           nbd_start_device
> >>>>>>>           lock
> >>>>>>>           num_connections = 2
> >>>>>>>           unlock
> >>>>>>>           blk_mq_update_nr_hw_queues
> >>>>>>>
> >>>>>>> blk_mq_update_nr_hw_queues
> >>>>>>> //nr_hw_queues updated to 1 before failure
> >>>>>>> return -EINVAL
> >>>>>>>
> >>>>>>
> >>>>>> In the above case, yes I see that t1 would return -EINVAL (as
> >>>>>> config->num_connections doesn't match with num_connections)
> >>>>>> but then t3 would succeed to update nr_hw_queue (as both
> >>>>>> config->num_connections and num_connections set to 2 this
> >>>>>> time). Isn't it? If yes, then the above patch (from Ming)
> >>>>>> seems good.
> >>>>>
> >>>>> Emm, I'm confused, If you agree with the concurrent process, then
> >>>>> t3 update nr_hw_queues to 2 first and return sucess, later t1 update
> >>>>> nr_hw_queues back to 1 and return failure.
> >>>>
> >>>> It should be easy to avoid failure by simple retrying.
> >>>>
> >>> Yeah I think retry should be a safe bet here.
> >>>
> >>
> >> I really not sure about the retry, the above is just a scenario that I
> >> think of with a quick review, and there are still many concurrent
> >> scenarios that need to be checked, I'm kind of lost here.
> >>
> >> Except nbd_start_device() and nbd_add_socked(), I'm not confident
> >> other context that is synchronized with config_lock is not broken.
> >> However, I'm ok with the bet.
> >>
> >>> On another note, synchronizing nbd_start_device and nbd_add_socket
> >>> using nbd->task_setup looks more complex and rather we may use
> >>> nbd->pid to synchronize both. We need to move setting of nbd->pid
> >>> before we invoke blk_mq_update_nr_hw_queues in nbd_start_device.
> >>> Then in nbd_add_socket we can evaluate nbd->pid and if it's
> >>> non-NULL then we could assume that either nr_hw_queues update is in
> >>> progress or device has been setup and so return -EBUSY. I think
> >>> anyways updating number of connections once device is configured
> >>> would not be possible, so once nbd_start_device is initiated, we
> >>> shall prevent user adding more connections. If we follow this
> >>> approach then IMO we don't need to add retry discussed above.
> >>
> >> It's ok for me to forbit nbd_add_socked after nbd is configured, there
> >> is nowhere to use the added sock. And if there really are other contexts
> >> need to be synchronized, I think nbd->pid can be used as well.
> >>
> > 
> > Do we have a conclusion now? Feel free to send the retry version, or let
> > me know if I should send a new synchronize version.
> > 
> Personally, I prefer synchronizing nbd_start_device and nbd_add_socket
> using nbd->pid but I do agree retry version would also work. Having
> said that, lets wait for Ming's feedback as well.

IMO simpler fix, especially in concept, is more effective for addressing
this kind of issue, with less chance to introduce regression.

If no one objects, I may send the retry version.


Thanks,
Ming

