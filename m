Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 52876BCDC37
	for <lists+nbd@lfdr.de>; Fri, 10 Oct 2025 17:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EF53120687; Fri, 10 Oct 2025 15:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 10 15:18:10 2025
Old-Return-Path: <paul@paul-moore.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5E3F4205FF
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Oct 2025 15:01:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id udLhukUdPtD4 for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Oct 2025 15:00:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .paul-moore. - helo: .mail-pj1-x102b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D0E52205E2
	for <nbd@other.debian.org>; Fri, 10 Oct 2025 15:00:53 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so2799789a91.1
        for <nbd@other.debian.org>; Fri, 10 Oct 2025 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1760108449; x=1760713249; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrnkWgVz/Z49/J8nG6GzbbPnjpZrG1a+SrZMq+zyDL0=;
        b=K++A2hw4gVcNibmDXWj6sTVbay8KIUD7oWpWcroo1Fav32yke8nBsufhiFTcc49CZ4
         RGkwtClBKxqUn6kRVH5/7YoW9g+hSm9tBuQU9TWo7v3GBKqvS4tak4I3GCeyofCIaCYC
         Vvnw5PK5BXZnCjqprwYE97AfZLgj97OHYkh+UoDo8A2w9zSP9FzwCVDXXXdL6szUIPka
         +qVgHTpgutJ81gtM2Xf5cyMhQ/v78WKqABrVqB/89+7vh/4lqVE7yeNPjJ8S5Z/NzLpU
         Amrnk968XLaZMgKD498p/xpnV1mdQ5HBaoidb4GFY8qwg1drKLnLc7izBxJBuhqiYyhG
         MMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108449; x=1760713249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrnkWgVz/Z49/J8nG6GzbbPnjpZrG1a+SrZMq+zyDL0=;
        b=V7dxAM6KXQdMAnq76QRilNT3Ix39XqFvAYXB+DkdlWgOFXuwcHcUjFF7JTlwP3VWO5
         Ho/4pIUXGg8his7ZgyfKTcPMF3LuneHP/5DY+uTPl4E2Aw7LCZqEkkgTFhdyv0y5c8Fm
         12OWbbH8khzGSpqpFFD/DGZpNcyEFsh42YsssmzlJWmt+R3wjkGJb0ld6sztc/aZAZUW
         zUxhPJe4yn+HjLKLscuT8hqJd/F8Q/g7fY7DToRIEPK93cNAtGNiTIXa0JeDeSpPROk5
         XYP1aGCgY7wLcch5qUVIOgv8K32g89lBTHlXToYnz8fFb/39xvZxVZXiHA/jNzZj8eej
         kWxg==
X-Forwarded-Encrypted: i=1; AJvYcCWoIyXzhCImBtfPi09WtSS1TO4lLlK1aJ+A3I7pJik56HU9KW6vmr6cl35GzhXarBABK/k=@other.debian.org
X-Gm-Message-State: AOJu0YydSR76qJqbCzY/9n7wcZXrGwyt2/HlOBIB20gZaMKVtV8u/X6U
	uTFUyAZyABwsayzq7gGQVykae5tR8k6qiGQejHwhx71fugjt70aOu1nZr4jeiX72AiZxZ2dbwjs
	fyN3ZJqTe75cjGlMZF28yCYUpozzCZdinknzkpjOn
X-Gm-Gg: ASbGnct2ZYH/6uISA4VeonCywehjJdjHWQCz5AVcPS/wMsA12+XZONemCAOQb5hGVVN
	ieq4I3uhbNtVf/emByOlJRV6Z5Sk3wLeyOyxRX/WB/LGbuu1ZZpD5xmipk7vgwcgvjXXMCLORAK
	UxOTwQ/wAQQTIsjC5RQaIFBi7UcLYIv3152/AoTOHAv3wwxPnseDNpQoqu+Cv8fx3vHNTEB7igE
	BlPTmjemwCAyJ3dBeDQqc8iSg==
X-Google-Smtp-Source: AGHT+IHTYyhEFkKDD3X150o5MD7ZP8eFJxfaJJZoy46BgzM/dN96rHz0DqKMzJSZ8COyShPASIiBWoiLtZwKUFbGRtg=
X-Received: by 2002:a17:90b:1d8b:b0:32b:355a:9de with SMTP id
 98e67ed59e1d1-33b513d005amr16427754a91.32.1760108448726; Fri, 10 Oct 2025
 08:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251010080900.1680512-1-omosnace@redhat.com>
In-Reply-To: <20251010080900.1680512-1-omosnace@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 Oct 2025 11:00:37 -0400
X-Gm-Features: AS18NWDk8nitfjQpo1v3aBdPKBaoi907QLUPlKp_SF-2hEkCLZTSq-1OKrB7XMM
Message-ID: <CAHC9VhQxnTsZV=vjf1Wk5po16mLuKNPoi3UR-7gN6PxodncgxQ@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: override creds to kernel when calling sock_{send,recv}msg()
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eufRjO5XSBG.A.vUIF.yOS6oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3455
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHC9VhQxnTsZV=vjf1Wk5po16mLuKNPoi3UR-7gN6PxodncgxQ@mail.gmail.com
Resent-Date: Fri, 10 Oct 2025 15:18:10 +0000 (UTC)

On Fri, Oct 10, 2025 at 4:09=E2=80=AFAM Ondrej Mosnacek <omosnace@redhat.co=
m> wrote:
>
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
> [  165.189967] md: async del_gendisk mode will be removed in future, plea=
se upgrade to mdadm-4.5+
> [  165.252299] md/raid1:md127: active with 1 out of 2 mirrors
> [  165.252725] md127: detected capacity change from 0 to 522240
> [  165.255434] block nbd0: Send control failed (result -13)
> [  165.255718] block nbd0: Request send failed, requeueing
> [  165.256006] block nbd0: Dead connection, failed to find a fallback
> [  165.256041] block nbd0: Receive control failed (result -32)
> [  165.256423] block nbd0: shutting down sockets
> [  165.257196] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 2
> [  165.257736] Buffer I/O error on dev md127, logical block 0, async page=
 read
> [  165.258263] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 2
> [  165.259376] Buffer I/O error on dev md127, logical block 0, async page=
 read
> [  165.259920] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 2
> [  165.260628] Buffer I/O error on dev md127, logical block 0, async page=
 read
> [  165.261661] ldm_validate_partition_table(): Disk read failed.
> [  165.262108] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 2
> [  165.262769] Buffer I/O error on dev md127, logical block 0, async page=
 read
> [  165.263697] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 2
> [  165.264412] Buffer I/O error on dev md127, logical block 0, async page=
 read
> [  165.265412] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 2
> [  165.265872] Buffer I/O error on dev md127, logical block 0, async page=
 read
> [  165.266378] I/O error, dev nbd0, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 2
> [  165.267168] Buffer I/O error on dev md127, logical block 0, async page=
 read
> [  165.267564]  md127: unable to read partition table
> [  165.269581] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 2
> [  165.269960] Buffer I/O error on dev nbd0, logical block 0, async page =
read
> [  165.270316] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 2
> [  165.270913] Buffer I/O error on dev nbd0, logical block 0, async page =
read
> [  165.271253] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 2
> [  165.271809] Buffer I/O error on dev nbd0, logical block 0, async page =
read
> [  165.272074] ldm_validate_partition_table(): Disk read failed.
> [  165.272360]  nbd0: unable to read partition table
> [  165.289004] ldm_validate_partition_table(): Disk read failed.
> [  165.289614]  nbd0: unable to read partition table
>
> The corresponding SELinux denial on Fedora/RHEL will look like this
> (assuming it's not silenced):
> type=3DAVC msg=3Daudit(1758104872.510:116): avc:  denied  { write } for  =
pid=3D1908 comm=3D"mdadm" laddr=3D::1 lport=3D32772 faddr=3D::1 fport=3D108=
09 scontext=3Dsystem_u:system_r:mdadm_t:s0-s0:c0.c1023 tcontext=3Dunconfine=
d_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 tclass=3Dtcp_socket permissive=
=3D0
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
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2348878
> Fixes: 060406c61c7c ("block: add plug while submitting IO")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>
> Changes in v2:
>  * Move put_cred() after destroy_workqueue() in nbd_cleanup() to avoid a =
UAF
>  * Add some more details into the commit message
>  * Add a Fixes: tag
>
> v1: https://lore.kernel.org/linux-block/20251009134542.1529148-1-omosnace=
@redhat.com/
>
>  drivers/block/nbd.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

