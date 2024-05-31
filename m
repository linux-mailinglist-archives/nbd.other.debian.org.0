Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B38D6B19
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 22:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 45DD9205BA; Fri, 31 May 2024 20:51:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 20:51:13 2024
Old-Return-Path: <zyjzyj2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,LDO_WHITELIST,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0CCA1204ED
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 20:35:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.849 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WznY0sBvDo6b for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 20:35:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2A5EF2045C
	for <nbd@other.debian.org>; Fri, 31 May 2024 20:35:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5295eb47b48so2741701e87.1
        for <nbd@other.debian.org>; Fri, 31 May 2024 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717187739; x=1717792539; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3bObn2HYdzZsPQsK/+7bsdRUNbYSCHbt5PS/gQ/0a4=;
        b=FE22m+8gbeAxjLJREWfIeS8/vvIC3DKcDKrZwsnL7SHzOFmwti63I+PUKVW++QBrGs
         82RXm88te+1spemXDNw2W5GVSyt1/7UZ7gqI60Ctv2VOTjAsrokWuJHQW3v8htHcLOwt
         Zju969JKk3Una5bImSOko6C3gyhNEE160MGu0cycRU8VrpuID79dVyQ+xAdiLZg9pOD3
         iBU6bUo76tewHAKNFKlOr+rf1zbkip1BQx0G3AB31aHnvxQoreVEiARYQ33xzOUSU6Lx
         eJHLcJp0F1MfQ/JZf3h6OqB6OX/oG1cJyqoBX2pfdrPqnpXVyw3CFFzZ4COIlZlIC9aP
         C0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717187739; x=1717792539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3bObn2HYdzZsPQsK/+7bsdRUNbYSCHbt5PS/gQ/0a4=;
        b=A0VIw93/gA00DrieUKVjO2qMPLz98FxlSAf7V82m0SeE7Gp8PM/xrsdtZYZrvH7+Vu
         aQYG5zVcdygMc07Y8XqIVjV2lLfEujzNdwHtaEC92kv2+wyOCxN1pnAaYsGpvbqK7Ydb
         7UIQ2O3DSa5TbvvjG/hRNAc1c4SZvBOvIo1pWHKTx5pAAJ28US6GqblJ81Xk6VyZTSUw
         TtYWYXAKMzObgn77Q7vV/x/K1j157/ZG678ItN9x5yYUCmD+8xUCRafQdzLs4e5ejtR6
         6r9LBVmSQuFgBmTNbI05pQfegAMf/gSCKhRTeaLEREsSomPcDEp+9bjBAOoaNeuRYBd7
         Y2tg==
X-Forwarded-Encrypted: i=1; AJvYcCW2xT+GiA2Ao0rdaPttoxuU6OERGNJzJzzN+BdhwwVn/VxFLA9DfYwe080OVl/8jAspkINqmrzaVZEhWVvP80/005OqHw==
X-Gm-Message-State: AOJu0Yyl8quQfsrEhVDq2f7fJK+QY2IJ1ATCYZR9mwuVD3fHy7a1RmnU
	BegZ2FBj4uQRdqsTXoQ9HwbGI81x7goOUmO+KXqu7lrodkIYWNY1Bh73tZ/5qmC9xKtNpgIOml6
	7uVuEWhDIZeNlE5xcc3e+wqFKN/Q=
X-Google-Smtp-Source: AGHT+IEPEZTe85ma2n710NtfCYlQmJCM/+/sKx/9xMzB3Wn5S/worLuBz06Zmk2YjdZw5BwQykOfkrxtin/JB3RMFkI=
X-Received: by 2002:a05:6512:3d10:b0:52b:851e:256 with SMTP id
 2adb3069b0e04-52b8956960bmr2274835e87.2.1717187739001; Fri, 31 May 2024
 13:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <wnucs5oboi4flje5yvtea7puvn6zzztcnlrfz3lpzlwgblrxgw@7wvqdzioejgl>
 <6cd21274-50b3-44c5-af48-179cbd08b1ba@linux.dev> <b29f3a7a-3d58-44e1-b4ab-dbb4420c04a9@acm.org>
 <CAD=hENdBGcBSzcaniH+En6gecpay7S-fm1foEg5vmuXiVYxhpQ@mail.gmail.com> <0a82785a-a417-4f53-8f3a-2a9ad3ab3bf7@acm.org>
In-Reply-To: <0a82785a-a417-4f53-8f3a-2a9ad3ab3bf7@acm.org>
From: Zhu Yanjun <zyjzyj2000@gmail.com>
Date: Fri, 31 May 2024 22:35:28 +0200
Message-ID: <CAD=hENdgS40CmZs2o5M_O71k07Q7txg9-2XnaHP97_+eC9xT3w@mail.gmail.com>
Subject: Re: blktests failures with v6.10-rc1 kernel
To: Bart Van Assche <bvanassche@acm.org>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>, 
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <y1PWMi_A5RE.A.kjKC.BhjWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2886
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAD=hENdgS40CmZs2o5M_O71k07Q7txg9-2XnaHP97_+eC9xT3w@mail.gmail.com
Resent-Date: Fri, 31 May 2024 20:51:13 +0000 (UTC)

On Fri, May 31, 2024 at 10:08=E2=80=AFPM Bart Van Assche <bvanassche@acm.or=
g> wrote:
>
> On 5/31/24 13:06, Zhu Yanjun wrote:
> > On Fri, May 31, 2024 at 10:01=E2=80=AFPM Bart Van Assche <bvanassche@ac=
m.org> wrote:
> >>
> >> On 5/31/24 07:35, Zhu Yanjun wrote:
> >>> IIRC, the problem with srp/002, 011 also occurs with siw driver, do y=
ou make
> >>> tests with siw driver to verify whether the problem with srp/002, 011=
 is also > fixed or not?
> >>
> >> I have not yet seen any failures of any of the SRP tests when using th=
e siw driver.
> >> What am I missing?
>  >
>  > (left out a bunch of forwarded emails)
>
> Forwarding emails is not useful, especially if these emails do not answer=
 the question
> that I asked.

Bob had made tests with siw. From his mail, it seems that the similar
problem also occurs with SIW.

It is up to you^_^

Zhu Yanjun

>
> Thanks,
>
> Bart.

