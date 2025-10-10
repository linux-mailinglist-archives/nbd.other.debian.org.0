Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F461BCB70F
	for <lists+nbd@lfdr.de>; Fri, 10 Oct 2025 04:45:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 72DC220782; Fri, 10 Oct 2025 02:45:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 10 02:45:13 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 039F120691
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Oct 2025 02:27:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.563 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.467, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xQGpRffZZTpN for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Oct 2025 02:27:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 3A70C2067F
	for <nbd@other.debian.org>; Fri, 10 Oct 2025 02:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760063244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i+bdFMFNHkgehS6lKRlgA09l/95HXfHVJeMjlkNtBsw=;
	b=a72MvpTnreqtKCHDc+ORmQ8QLbWSvI6lPVc1U90TiZyCyn5NA+YvElj7zHptInR1g2TFN1
	0rm2HvIhfHIVkGS/Pa5jCJvaEocqrzqID+3/kBh/R3jNu6wNFVV7Cc6HgxPl9KfJZ8K+RI
	WEiVPLi0D6jsuVjhkDzGozo53Lc65v4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-9LsV7PeENVmDlC1RwhlQcg-1; Thu,
 09 Oct 2025 21:56:37 -0400
X-MC-Unique: 9LsV7PeENVmDlC1RwhlQcg-1
X-Mimecast-MFC-AGG-ID: 9LsV7PeENVmDlC1RwhlQcg_1760061396
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AADF41956086;
	Fri, 10 Oct 2025 01:56:35 +0000 (UTC)
Received: from fedora (unknown [10.72.120.13])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C05741955F22;
	Fri, 10 Oct 2025 01:56:30 +0000 (UTC)
Date: Fri, 10 Oct 2025 09:56:24 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH] nbd: override creds to kernel when calling
 sock_{send,recv}msg()
Message-ID: <aOhnyMtw0a0fqaNO@fedora>
References: <20251009134542.1529148-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009134542.1529148-1-omosnace@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <j7MQQLOIdhJ.A.8fbI.5MH6oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3451
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aOhnyMtw0a0fqaNO@fedora
Resent-Date: Fri, 10 Oct 2025 02:45:13 +0000 (UTC)

On Thu, Oct 09, 2025 at 03:45:42PM +0200, Ondrej Mosnacek wrote:
> sock_{send,recv}msg() internally calls security_socket_{send,recv}msg(),
> which does security checks (e.g. SELinux) for socket access against the
> current task. However, _sock_xmit() in drivers/block/nbd.c may be called
> indirectly from a userspace syscall, where the NBD socket access would
> be incorrectly checked against the calling userspace task (which simply
> tries to read/write a file that happens to reside on an NBD device).
> 
> To fix this, temporarily override creds to kernel ones before calling
> the sock_*() functions. This allows the security modules to recognize
> this as internal access by the kernel, which will normally be allowed.
> 
> A way to trigger the issue is to do the following (on a system with
> SELinux set to enforcing):
> 
>     ### Create nbd device:
>     truncate -s 256M /tmp/testfile
>     nbd-server localhost:10809 /tmp/testfile
> 
>     ### Connect to the nbd server:
>     nbd-client localhost
> 
>     ### Create mdraid array
>     mdadm --create -l 1 -n 2 /dev/md/testarray /dev/nbd0 missing

-EACCESS is triggered when reading data from mdadm process:

@security[mdadm, -13,
        handshake_exit+221615650
        handshake_exit+221615650
        handshake_exit+221616465
        security_socket_sendmsg+5
        sock_sendmsg+106
        handshake_exit+221616150
        sock_sendmsg+5
        __sock_xmit+162
        nbd_send_cmd+597
        nbd_handle_cmd+377
        nbd_queue_rq+63
        blk_mq_dispatch_rq_list+653
        __blk_mq_do_dispatch_sched+184
        __blk_mq_sched_dispatch_requests+333
        blk_mq_sched_dispatch_requests+38
        blk_mq_run_hw_queue+239
        blk_mq_dispatch_plug_list+382
        blk_mq_flush_plug_list.part.0+55
        __blk_flush_plug+241
        __submit_bio+353
        submit_bio_noacct_nocheck+364
        submit_bio_wait+84
        __blkdev_direct_IO_simple+232
        blkdev_read_iter+162
        vfs_read+591
        ksys_read+95
        do_syscall_64+92
        entry_SYSCALL_64_after_hwframe+120
]: 1

The issue is started to expose since f1daaaf0c1fa ("block: add plug while submitting IO").

> 
>     ### Stop the array
>     mdadm --stop /dev/md/testarray
> 
>     ### Disconnect the nbd device
>     nbd-client -d /dev/nbd0
> 
>     ### Reconnect to nbd devices:
>     nbd-client localhost

The above steps don't matter actually.

> 
> After these steps, assuming the SELinux policy doesn't allow the
> unexpected access pattern, errors will be visible on the kernel console:
> 
> [   93.997980] nbd2: detected capacity change from 0 to 524288
> [  100.314271] md/raid1:md126: active with 1 out of 2 mirrors
> [  100.314301] md126: detected capacity change from 0 to 522240
> [  100.317288] block nbd2: Send control failed (result -13)           <-----
> [  100.317306] block nbd2: Request send failed, requeueing            <-----
> [  100.318765] block nbd2: Receive control failed (result -32)        <-----
> [  100.318783] block nbd2: Dead connection, failed to find a fallback
> [  100.318794] block nbd2: shutting down sockets
> [  100.318802] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.318817] Buffer I/O error on dev md126, logical block 0, async page read
> [  100.322000] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.322016] Buffer I/O error on dev md126, logical block 0, async page read
> [  100.323244] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.323253] Buffer I/O error on dev md126, logical block 0, async page read
> [  100.324436] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.324444] Buffer I/O error on dev md126, logical block 0, async page read
> [  100.325621] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.325630] Buffer I/O error on dev md126, logical block 0, async page read
> [  100.326813] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.326822] Buffer I/O error on dev md126, logical block 0, async page read
> [  100.326834]  md126: unable to read partition table
> [  100.329872] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.329889] Buffer I/O error on dev nbd2, logical block 0, async page read
> [  100.331186] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.331195] Buffer I/O error on dev nbd2, logical block 0, async page read
> [  100.332371] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.332379] Buffer I/O error on dev nbd2, logical block 0, async page read
> [  100.333550] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  100.333559] Buffer I/O error on dev nbd2, logical block 0, async page read
> [  100.334721]  nbd2: unable to read partition table
> [  100.350993]  nbd2: unable to read partition table
> 
> The corresponding SELinux denial on Fedora/RHEL will look like this
> (assuming it's not silenced):
> type=AVC msg=audit(1758104872.510:116): avc:  denied  { write } for  pid=1908 comm="mdadm" laddr=::1 lport=32772 faddr=::1 fport=10809 scontext=system_u:system_r:mdadm_t:s0-s0:c0.c1023 tcontext=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 tclass=tcp_socket permissive=0
> 
> Cc: Ming Lei <ming.lei@redhat.com>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2348878
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  drivers/block/nbd.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 6463d0e8d0cef..d50055c974a6b 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -52,6 +52,7 @@
>  static DEFINE_IDR(nbd_index_idr);
>  static DEFINE_MUTEX(nbd_index_mutex);
>  static struct workqueue_struct *nbd_del_wq;
> +static struct cred *nbd_cred;
>  static int nbd_total_devices = 0;
>  
>  struct nbd_sock {
> @@ -554,6 +555,7 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
>  	int result;
>  	struct msghdr msg = {} ;
>  	unsigned int noreclaim_flag;
> +	const struct cred *old_cred;
>  
>  	if (unlikely(!sock)) {
>  		dev_err_ratelimited(disk_to_dev(nbd->disk),
> @@ -562,6 +564,8 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
>  		return -EINVAL;
>  	}
>  
> +	old_cred = override_creds(nbd_cred);
> +
>  	msg.msg_iter = *iter;
>  
>  	noreclaim_flag = memalloc_noreclaim_save();
> @@ -586,6 +590,8 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
>  
>  	memalloc_noreclaim_restore(noreclaim_flag);
>  
> +	revert_creds(old_cred);
> +
>  	return result;
>  }
>  
> @@ -2669,7 +2675,15 @@ static int __init nbd_init(void)
>  		return -ENOMEM;
>  	}
>  
> +	nbd_cred = prepare_kernel_cred(&init_task);
> +	if (!nbd_cred) {
> +		destroy_workqueue(nbd_del_wq);
> +		unregister_blkdev(NBD_MAJOR, "nbd");
> +		return -ENOMEM;
> +	}
> +
>  	if (genl_register_family(&nbd_genl_family)) {
> +		put_cred(nbd_cred);
>  		destroy_workqueue(nbd_del_wq);
>  		unregister_blkdev(NBD_MAJOR, "nbd");
>  		return -EINVAL;
> @@ -2706,6 +2720,8 @@ static void __exit nbd_cleanup(void)
>  
>  	nbd_dbg_close();
>  
> +	put_cred(nbd_cred);
> +
>  	mutex_lock(&nbd_index_mutex);
>  	idr_for_each(&nbd_index_idr, &nbd_exit_cb, &del_list);
>  	mutex_unlock(&nbd_index_mutex);

Yeah, as commented by Stephen and Paul, put_cred() need to be moved after
destroy_workqueue(nbd_del_wq) in which wq function nbd disk is removed and
recv wq is destroyed.

Otherwise, this patch looks fine from block layer viewpoint, and I verified
that it does fix the -EACCESS failure for madadm to read from nbd.

Thanks,
Ming

