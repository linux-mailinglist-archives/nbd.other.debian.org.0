Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 94810BCC40B
	for <lists+nbd@lfdr.de>; Fri, 10 Oct 2025 11:00:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 67251205DE; Fri, 10 Oct 2025 09:00:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 10 09:00:12 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 89193205FE
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Oct 2025 08:43:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.563 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.467, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ju1V7JkRJsaq for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Oct 2025 08:43:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 2D252205FA
	for <nbd@other.debian.org>; Fri, 10 Oct 2025 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760085776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tj95A7CoAoXwd9E9yUvXB1VX2Vc0uT0vBy1AY/58rzQ=;
	b=I0Xc/qANOxg5rdXj9GHbm2zBjC36gVNKdLizDtTApzd3qpU9csPaMIE2EKxMIfn/Mfzidp
	sP+sGo/wtMiYnsKX77JFD1DeJeDWTtd2hY3rNWHkFMhU249zbDPMpeyvCeH7cXukXZdbis
	BI7iSuE8fgPzxCsM87lLSKzaI22Nddw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-NS3_-tnANSyyVfn5eMae5Q-1; Fri,
 10 Oct 2025 04:42:53 -0400
X-MC-Unique: NS3_-tnANSyyVfn5eMae5Q-1
X-Mimecast-MFC-AGG-ID: NS3_-tnANSyyVfn5eMae5Q_1760085772
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7A3B19560B3;
	Fri, 10 Oct 2025 08:42:51 +0000 (UTC)
Received: from fedora (unknown [10.72.120.27])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B65871800447;
	Fri, 10 Oct 2025 08:42:46 +0000 (UTC)
Date: Fri, 10 Oct 2025 16:42:41 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH v2] nbd: override creds to kernel when calling
 sock_{send,recv}msg()
Message-ID: <aOjHAfviTrT5RIRi@fedora>
References: <20251010080900.1680512-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010080900.1680512-1-omosnace@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ulAE72EnawP.A.kc4P.csM6oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3453
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aOjHAfviTrT5RIRi@fedora
Resent-Date: Fri, 10 Oct 2025 09:00:12 +0000 (UTC)

On Fri, Oct 10, 2025 at 10:09:00AM +0200, Ondrej Mosnacek wrote:
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
> 
> After these steps, assuming the SELinux policy doesn't allow the
> unexpected access pattern, errors will be visible on the kernel console:
> 
> [  142.204243] nbd0: detected capacity change from 0 to 524288
> [  165.189967] md: async del_gendisk mode will be removed in future, please upgrade to mdadm-4.5+
> [  165.252299] md/raid1:md127: active with 1 out of 2 mirrors
> [  165.252725] md127: detected capacity change from 0 to 522240
> [  165.255434] block nbd0: Send control failed (result -13)
> [  165.255718] block nbd0: Request send failed, requeueing
> [  165.256006] block nbd0: Dead connection, failed to find a fallback
> [  165.256041] block nbd0: Receive control failed (result -32)
> [  165.256423] block nbd0: shutting down sockets
> [  165.257196] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.257736] Buffer I/O error on dev md127, logical block 0, async page read
> [  165.258263] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.259376] Buffer I/O error on dev md127, logical block 0, async page read
> [  165.259920] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.260628] Buffer I/O error on dev md127, logical block 0, async page read
> [  165.261661] ldm_validate_partition_table(): Disk read failed.
> [  165.262108] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.262769] Buffer I/O error on dev md127, logical block 0, async page read
> [  165.263697] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.264412] Buffer I/O error on dev md127, logical block 0, async page read
> [  165.265412] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.265872] Buffer I/O error on dev md127, logical block 0, async page read
> [  165.266378] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.267168] Buffer I/O error on dev md127, logical block 0, async page read
> [  165.267564]  md127: unable to read partition table
> [  165.269581] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.269960] Buffer I/O error on dev nbd0, logical block 0, async page read
> [  165.270316] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.270913] Buffer I/O error on dev nbd0, logical block 0, async page read
> [  165.271253] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
> [  165.271809] Buffer I/O error on dev nbd0, logical block 0, async page read
> [  165.272074] ldm_validate_partition_table(): Disk read failed.
> [  165.272360]  nbd0: unable to read partition table
> [  165.289004] ldm_validate_partition_table(): Disk read failed.
> [  165.289614]  nbd0: unable to read partition table
> 
> The corresponding SELinux denial on Fedora/RHEL will look like this
> (assuming it's not silenced):
> type=AVC msg=audit(1758104872.510:116): avc:  denied  { write } for  pid=1908 comm="mdadm" laddr=::1 lport=32772 faddr=::1 fport=10809 scontext=system_u:system_r:mdadm_t:s0-s0:c0.c1023 tcontext=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 tclass=tcp_socket permissive=0
> 
> The respective backtrace looks like this:
> @security[mdadm, -13,
>         handshake_exit+221615650
>         handshake_exit+221615650
>         handshake_exit+221616465
>         security_socket_sendmsg+5
>         sock_sendmsg+106
>         handshake_exit+221616150
>         sock_sendmsg+5
>         __sock_xmit+162
>         nbd_send_cmd+597
>         nbd_handle_cmd+377
>         nbd_queue_rq+63
>         blk_mq_dispatch_rq_list+653
>         __blk_mq_do_dispatch_sched+184
>         __blk_mq_sched_dispatch_requests+333
>         blk_mq_sched_dispatch_requests+38
>         blk_mq_run_hw_queue+239
>         blk_mq_dispatch_plug_list+382
>         blk_mq_flush_plug_list.part.0+55
>         __blk_flush_plug+241
>         __submit_bio+353
>         submit_bio_noacct_nocheck+364
>         submit_bio_wait+84
>         __blkdev_direct_IO_simple+232
>         blkdev_read_iter+162
>         vfs_read+591
>         ksys_read+95
>         do_syscall_64+92
>         entry_SYSCALL_64_after_hwframe+120
> ]: 1
> 
> The issue has started to appear since commit 060406c61c7c ("block: add
> plug while submitting IO").
> 
> Cc: Ming Lei <ming.lei@redhat.com>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2348878
> Fixes: 060406c61c7c ("block: add plug while submitting IO")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

Looks fine:

Reviewed-by: Ming Lei <ming.lei@redhat.com>
Tested-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming

