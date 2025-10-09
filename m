Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 03709BC9A13
	for <lists+nbd@lfdr.de>; Thu, 09 Oct 2025 16:51:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AF75F205CA; Thu,  9 Oct 2025 14:51:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct  9 14:51:11 2025
Old-Return-Path: <stephen.smalley.work@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 67622205CA
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Oct 2025 14:34:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QYZjIq7qhWKG for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Oct 2025 14:34:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E61C3205C6
	for <nbd@other.debian.org>; Thu,  9 Oct 2025 14:34:22 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3307de086d8so1049004a91.2
        for <nbd@other.debian.org>; Thu, 09 Oct 2025 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760020459; x=1760625259; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXhOvAzmzc0GvVnS1tQnnQLU3R7CgJXBguM6XCQyMzM=;
        b=CM/sndWh/kUH8/VQXNiMU7XlkynBBe/xeOdSPXTy5dHNLTWBgJ/suVowv3IU/RZsJa
         LVHL1wKgd5uw1iezVCQwzfY7bUNHp9tQAfZjt80ug/lVoA1Cc42R4GVuPlcE8VRMTpZS
         U8xNfIEsEQ1vrecGVj45/Rxt77UcMGhCp/xk4CoUzZ/ZBoigUFx2JG6yEW/bjWqeOA8r
         N5Lg761pl/IWuJGmUfj5Hh5ITSiM2EtRmkGCT1UarO4xonvhFHkEZ8KfUiYKF3gtF75D
         1ogjQJRzf94U31gAQZrma8dW3WAzR8GPb69EfO3QxbQ0nET2Q2CDCgR4XfzmWXb8RWiC
         hnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020459; x=1760625259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXhOvAzmzc0GvVnS1tQnnQLU3R7CgJXBguM6XCQyMzM=;
        b=TS8u8jxaZ0usomr2+urFp1NZ0hBwOWWMpwRHgSvDFDJ4MOID+ythXzNJIrVhhFYi2C
         SKtgAGoRRXSiLzlfMSJ8LuC5qCDJXFuCydO/J/VTYnDQ/WsJp+gEbrWwMrkngOM3Fli8
         8IOMPPjeF/o9u92/5UzyqrMLWb0bkct6k1ceOLYzf9LdVJR7HzkKw4mOw2tcBnaykVmn
         4dmI0AEv+u6UfQY1sEuVzTN6wAflnI8cl5TkbOlDGHZthH19Qdxb3qrI3bXeyrMgr6mS
         rO+LOF7xugnLkqmYTQ3PBQNJE3nKtOPg3uc2xAML0ojRUNlEXfZfqFi8Cbu9K//RJMVo
         dpkA==
X-Forwarded-Encrypted: i=1; AJvYcCXGH6YRTchm4jTXviDfZekkZoRCB4IwSIGFn/LFDjGAt7HuN59lbIjUTS5UUBkYpw2jbNc=@other.debian.org
X-Gm-Message-State: AOJu0YxKZUgm5BOTD6Rso7pScrAQ99Y/KRzGt1u4B4Il30XB8kZe5/37
	AGIpEKDkifdIitKf5ej6lf5ykBGC8yWRqD1zvgwARhGqrbWd2VXk7uT33/mZtolZ1XbaIcfhwpg
	3Q0jqOEQuHkgA8zHpw+eygBsUcWQuUzg=
X-Gm-Gg: ASbGncsr9TTj9nXgzEbHxduO4Y3g86ruUeMBW9dYu7JbSV3P2teKxzdGbjaVL8pcEPa
	1n2IRViALlfREIsO/8XFrfeQMj5bhFsmySXHL2NzA1SOuWD2DnJngZkeK96cn+4zEUU9AoN+ywt
	csGWz0Rsu9EvCNT/MtS2LP2Ds3620DOqdxtkvloUCnG5+6pxVVCmp/+OwwTojSLsBrTtI79erIh
	fhfpXPkKY9vdcQMJFNF7p/MqSkD2Kg=
X-Google-Smtp-Source: AGHT+IE0FyTWJTq8nNxDIDVzLQpkTa20O70x0XEV4iCcmNbD7lkGlBsmUhjy2yWOzTbNZdjdShvAmvMqn4yGx1F3t+I=
X-Received: by 2002:a17:90b:4d08:b0:335:2b15:7f46 with SMTP id
 98e67ed59e1d1-33b51386306mr9422330a91.21.1760020458863; Thu, 09 Oct 2025
 07:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251009134542.1529148-1-omosnace@redhat.com>
In-Reply-To: <20251009134542.1529148-1-omosnace@redhat.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 9 Oct 2025 10:34:07 -0400
X-Gm-Features: AS18NWCuXR1l9gjzn2FNttABJQiTYMBIHxdHz9LK52jfaS2yv93GQY95p1KmfV8
Message-ID: <CAEjxPJ5FVGt0KR=wNmU=e_R5cD6T4K1VRabaZmDAWMd0ZNnPNA@mail.gmail.com>
Subject: Re: [PATCH] nbd: override creds to kernel when calling sock_{send,recv}msg()
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <x3rgpIzZDVD.A.TeeP.fv85oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3449
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAEjxPJ5FVGt0KR=wNmU=e_R5cD6T4K1VRabaZmDAWMd0ZNnPNA@mail.gmail.com
Resent-Date: Thu,  9 Oct 2025 14:51:11 +0000 (UTC)

On Thu, Oct 9, 2025 at 9:45=E2=80=AFAM Ondrej Mosnacek <omosnace@redhat.com=
> wrote:
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
>     ### Stop the array
>     mdadm --stop /dev/md/testarray
>
>     ### Disconnect the nbd device
>     nbd-client -d /dev/nbd0
>
>     ### Reconnect to nbd devices:
>     nbd-client localhost
>
> After these steps, assuming the SELinux policy doesn't allow the
> unexpected access pattern, errors will be visible on the kernel console:
>
> [   93.997980] nbd2: detected capacity change from 0 to 524288
> [  100.314271] md/raid1:md126: active with 1 out of 2 mirrors
> [  100.314301] md126: detected capacity change from 0 to 522240
> [  100.317288] block nbd2: Send control failed (result -13)           <--=
---
> [  100.317306] block nbd2: Request send failed, requeueing            <--=
---
> [  100.318765] block nbd2: Receive control failed (result -32)        <--=
---
> [  100.318783] block nbd2: Dead connection, failed to find a fallback
> [  100.318794] block nbd2: shutting down sockets
> [  100.318802] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.318817] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.322000] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.322016] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.323244] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.323253] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.324436] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.324444] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.325621] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.325630] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.326813] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.326822] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.326834]  md126: unable to read partition table
> [  100.329872] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  100.329889] Buffer I/O error on dev nbd2, logical block 0, async page =
read
> [  100.331186] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  100.331195] Buffer I/O error on dev nbd2, logical block 0, async page =
read
> [  100.332371] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  100.332379] Buffer I/O error on dev nbd2, logical block 0, async page =
read
> [  100.333550] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  100.333559] Buffer I/O error on dev nbd2, logical block 0, async page =
read
> [  100.334721]  nbd2: unable to read partition table
> [  100.350993]  nbd2: unable to read partition table
>
> The corresponding SELinux denial on Fedora/RHEL will look like this
> (assuming it's not silenced):
> type=3DAVC msg=3Daudit(1758104872.510:116): avc:  denied  { write } for  =
pid=3D1908 comm=3D"mdadm" laddr=3D::1 lport=3D32772 faddr=3D::1 fport=3D108=
09 scontext=3Dsystem_u:system_r:mdadm_t:s0-s0:c0.c1023 tcontext=3Dunconfine=
d_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 tclass=3Dtcp_socket permissive=
=3D0
>
> Cc: Ming Lei <ming.lei@redhat.com>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2348878
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
>  static int nbd_total_devices =3D 0;
>
>  struct nbd_sock {
> @@ -554,6 +555,7 @@ static int __sock_xmit(struct nbd_device *nbd, struct=
 socket *sock, int send,
>         int result;
>         struct msghdr msg =3D {} ;
>         unsigned int noreclaim_flag;
> +       const struct cred *old_cred;
>
>         if (unlikely(!sock)) {
>                 dev_err_ratelimited(disk_to_dev(nbd->disk),
> @@ -562,6 +564,8 @@ static int __sock_xmit(struct nbd_device *nbd, struct=
 socket *sock, int send,
>                 return -EINVAL;
>         }
>
> +       old_cred =3D override_creds(nbd_cred);
> +
>         msg.msg_iter =3D *iter;
>
>         noreclaim_flag =3D memalloc_noreclaim_save();
> @@ -586,6 +590,8 @@ static int __sock_xmit(struct nbd_device *nbd, struct=
 socket *sock, int send,
>
>         memalloc_noreclaim_restore(noreclaim_flag);
>
> +       revert_creds(old_cred);
> +
>         return result;
>  }
>
> @@ -2669,7 +2675,15 @@ static int __init nbd_init(void)
>                 return -ENOMEM;
>         }
>
> +       nbd_cred =3D prepare_kernel_cred(&init_task);
> +       if (!nbd_cred) {
> +               destroy_workqueue(nbd_del_wq);
> +               unregister_blkdev(NBD_MAJOR, "nbd");
> +               return -ENOMEM;
> +       }
> +
>         if (genl_register_family(&nbd_genl_family)) {
> +               put_cred(nbd_cred);
>                 destroy_workqueue(nbd_del_wq);
>                 unregister_blkdev(NBD_MAJOR, "nbd");
>                 return -EINVAL;
> @@ -2706,6 +2720,8 @@ static void __exit nbd_cleanup(void)
>
>         nbd_dbg_close();
>
> +       put_cred(nbd_cred);
> +

Should this be done at the end, after the workqueue is destroyed?

>         mutex_lock(&nbd_index_mutex);
>         idr_for_each(&nbd_index_idr, &nbd_exit_cb, &del_list);
>         mutex_unlock(&nbd_index_mutex);
> --
> 2.51.0
>
>

