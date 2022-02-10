Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 168554B1507
	for <lists+nbd@lfdr.de>; Thu, 10 Feb 2022 19:12:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4DAEA204D2; Thu, 10 Feb 2022 18:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 10 18:12:09 2022
Old-Return-Path: <tonynelsonson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=4.0 tests=CAPINIT,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1F92E20496
	for <lists-other-nbd@bendel.debian.org>; Thu, 10 Feb 2022 17:56:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.801 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, CAPINIT=0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ciO9R3iWMhdH for <lists-other-nbd@bendel.debian.org>;
	Thu, 10 Feb 2022 17:56:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4DFDF2048C
	for <nbd@other.debian.org>; Thu, 10 Feb 2022 17:56:13 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id g18so3411640uak.5
        for <nbd@other.debian.org>; Thu, 10 Feb 2022 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=pypwbY1qJPzMZz1nCuJqprSaF/Rglgrxm/XpjftGJVk=;
        b=isSCwwoTCE4+v5xnk3BGYwE9PNqdAYWRMuvvnpg6qz0z/9lv7BRKo2/mopWjNImXvv
         pwstngUcpuwBXW2IsZ0KjAKO8CpRA7ow5tHImtp2ChgMspFJy0jwfqRk1aBs2fVD71/J
         Aic3sV5nMF08hDduAzbAp5XfEAlrXO1CmVYvyYZ4wANgaBohNVMcVeVfxe/J7uXnnuSg
         XMOZVgWYsbV2p/fhlsc3WZnlutF96/JznVIp/fMXjeJOXulSwDQ1eWut8rf68xuIMR5o
         ifXKgxvh69rx2Rusj/qcidPx9Dv7rtB/LXN/KwT5UgdcbEAUF6F32lTMSSEDDH6WWweV
         e4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pypwbY1qJPzMZz1nCuJqprSaF/Rglgrxm/XpjftGJVk=;
        b=PFkHShSETaywbNtEl3tCNg4lhqgjy05v7Nnb4QdAzGNkI2pNzWpaqxW7NneCvxnrgA
         xlqfhC/Nq6PPhAtc0hMB1eTBMkx3U4p+U6N3u5IkILZwkWMo4DTUDPCkKHQFKJtcpD6f
         wjq0CY5cIPC5Q/E7ZwTHt+MX5RahZPwQjqbmchs9MPEPnus/2ipuau4FRwTGRrFSY3+Q
         cPmypqvGO7L02nPuB800hFKUKTutMfiFK/mGGxRrKeF3ZtY4Ayc4hc//xEXt2eLkhrhd
         akj5uBaRMwA2OZ6c11Nt+XfI7YD9aMio7ULY6vbrMzu7NiJHhkujUgcRSdwBWCcwRQqO
         LQUA==
X-Gm-Message-State: AOAM532Vg63s7GhYc3v+hCt+Pkzu3gcSx85v3S5vtngUcKKKlF4h1vMk
	MRiCZAW2k7SGWsvTd0ATUKanO5LEdVtmvNVAOt8=
X-Google-Smtp-Source: ABdhPJzh/JbSlzkyeVLIH/qFL5Zi+Ob2+RY4lavyMUEeVpOR8+xxy4+jHib8UZDbU/MEk4cg3MbZCb1PF/yERD4m3Ag=
X-Received: by 2002:ab0:3045:: with SMTP id x5mr2874248ual.17.1644515769944;
 Thu, 10 Feb 2022 09:56:09 -0800 (PST)
MIME-Version: 1.0
From: Nathan Caleb <nathancalebnathan@gmail.com>
Date: Thu, 10 Feb 2022 05:55:47 -1200
Message-ID: <CAF=5axs_6ydz0sjvjU_hPju8Aausn2v+zJ7s6MXv2_4vfq_dJw@mail.gmail.com>
Subject: From Karen Smith Trust
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000004b8f3405d7adaa6b"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MOkI5-DmrJJ.A.3GC.5VVBiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1713
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAF=5axs_6ydz0sjvjU_hPju8Aausn2v+zJ7s6MXv2_4vfq_dJw@mail.gmail.com
Resent-Date: Thu, 10 Feb 2022 18:12:09 +0000 (UTC)

--0000000000004b8f3405d7adaa6b
Content-Type: text/plain; charset="UTF-8"

I wrote a previous message which was not answered, hope all is well with
you?

Sincerely yours
Nathan Caleb
For Karen Smith Trust

--0000000000004b8f3405d7adaa6b
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">I wrote a previous message which was not answered, hope all is well with you?<br><br>Sincerely yours<br>Nathan Caleb<br>For Karen Smith Trust<br></div>

--0000000000004b8f3405d7adaa6b--

