Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4996B6DE8
	for <lists+nbd@lfdr.de>; Mon, 13 Mar 2023 04:21:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 474B120872; Mon, 13 Mar 2023 03:21:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 13 03:21:14 2023
Old-Return-Path: <minlei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B8D3920862
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Mar 2023 03:04:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id g5_hodIVn2yP for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Mar 2023 03:04:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7560A20861
	for <nbd@other.debian.org>; Mon, 13 Mar 2023 03:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678676673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQANVrvaj9/B2WSrHSzaItV2LmCoP7qwGr+9zKi06ow=;
	b=Ss/jhcn3qWPpcxYmqzgzaoYjnbq8HhXtlLbI9G7K3oV2uzv4qKVZwiLwip6+W9jO/0bryx
	SSRUK9qB9Hdt49/b+Iwn31haN3jFLZy751aycCZPP//eNMRVLtRSkRP+NL8kuIJI1YonKy
	JZpdKWxtncu6DTtjHzR7MQnskZuRbo0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-TQN6e7SkNF2uGxeRgXjurQ-1; Sun, 12 Mar 2023 23:04:31 -0400
X-MC-Unique: TQN6e7SkNF2uGxeRgXjurQ-1
Received: by mail-vs1-f69.google.com with SMTP id d11-20020a67e40b000000b00423e86efa13so414226vsf.4
        for <nbd@other.debian.org>; Sun, 12 Mar 2023 20:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678676671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQANVrvaj9/B2WSrHSzaItV2LmCoP7qwGr+9zKi06ow=;
        b=Ddw2K8oQLzCvaSkNzUgmqqoJ9ALNh3NQK3sTC8oKoHuoMUpfqBuNXVeFKDh8yHEJGy
         dTQKemKntcrkIdu//0SUuTCY7UwlMRd6Ev4n2hrZXQ5agpUG9+tSmhtM5LOBOK8dWToC
         usED/OMQ0/2p1gB151fSBF01pty4hV+0ccSi6oLM2rdQzjTX3S3M3ykyWK6rkDe3tDsk
         J1LDQXlDqGMpmT/AFY+0TRTkPRdaokn5IIYUqZvpFEUSj2o3H8QI1s0xv0YiaKls9cNH
         6f4y5dEeFhVQawQtFonqavzhI7/GeIBG8BQAn58MU6j5LDEqGaVR0NhwF5O4jz9bvMQr
         6GXQ==
X-Gm-Message-State: AO0yUKU8jJl6eUqjBiszfNIyy8HmeZxV4tSXBgMKsZkCu1RHHZBUpLz7
	cPCb79+T7L197CWFF4iziMA264BdwmIB00XXqrF1Ep3N7hQiyWLIYMOYZex5roV2sq7Mp/JVURr
	nHx8U5/Ii/gwZo0Gi4GRjYzdXwXx30Q==
X-Received: by 2002:a1f:4b01:0:b0:401:8898:ea44 with SMTP id y1-20020a1f4b01000000b004018898ea44mr18555384vka.3.1678676671152;
        Sun, 12 Mar 2023 20:04:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set83d8dKkzLeJ9M1ow+hnonqiyLfMHFAS+UySCvJj8sJK2fNKWzzVwX2uSVj8vcnI9W5BAG2+1uG1juFgoNFqic=
X-Received: by 2002:a1f:4b01:0:b0:401:8898:ea44 with SMTP id
 y1-20020a1f4b01000000b004018898ea44mr18555374vka.3.1678676670837; Sun, 12 Mar
 2023 20:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230310201525.2615385-1-eblake@redhat.com> <20230310201525.2615385-2-eblake@redhat.com>
In-Reply-To: <20230310201525.2615385-2-eblake@redhat.com>
From: Ming Lei <ming.lei@redhat.com>
Date: Mon, 13 Mar 2023 11:04:19 +0800
Message-ID: <CAFj5m9JmwYn9BTYEWWFykC_20rDVXfENKRbD2A=G=DmM4ni1-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] uapi nbd: improve doc links to userspace spec
To: Eric Blake <eblake@redhat.com>
Cc: josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org, 
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WA34yqOa6yH.A.zQ.qapDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2385
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFj5m9JmwYn9BTYEWWFykC_20rDVXfENKRbD2A=G=DmM4ni1-g@mail.gmail.com
Resent-Date: Mon, 13 Mar 2023 03:21:14 +0000 (UTC)

On Sat, Mar 11, 2023 at 4:17=E2=80=AFAM Eric Blake <eblake@redhat.com> wrot=
e:
>
> The uapi <linux/nbd.h> header intentionally documents only the NBD
> server features that the kernel module will utilize as a client.  But
> while it already had one mention of skipped bits due to userspace
> extensions, it did not actually direct the reader to the canonical
> source to learn about those extensions.
>
> While touching comments, fix an outdated reference that listed only
> READ and WRITE as commands.
>
> The documentation file also had a stale link to sourceforge; nbd
> ditched that several years ago in favor of github.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

