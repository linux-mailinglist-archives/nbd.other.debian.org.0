Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 211EE534552
	for <lists+nbd@lfdr.de>; Wed, 25 May 2022 22:51:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 05F32205B0; Wed, 25 May 2022 20:51:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 25 20:51:13 2022
Old-Return-Path: <luisadonstin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,GMAIL,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C9BC920635
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 May 2022 20:35:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.791 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, GMAIL=1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pdR-e69ZB9YO for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 May 2022 20:35:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6170C205BA
	for <nbd@other.debian.org>; Wed, 25 May 2022 20:35:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id f21so30250029ejh.11
        for <nbd@other.debian.org>; Wed, 25 May 2022 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jF4MxsPSKKSAh34A0y7fWqFeFSCCDQ9NCjS0um7aELU=;
        b=VocQsthp4kr71VkA6y/yGQ8r7PzvrX8S0kDee5bYwGXinCWOEWzdKcvX7qcajQQvGu
         FO46yq2dNFoJHRXEn1midlW/oMmMAE/tH12+3dL6eCDwk/aXnzFoZCoXYF7Tr2XdXAWF
         A14RSJ7nwmV5Qn/QoKcAQnffjrruBdZQi5J4nFon7T4xNFyrzXHYChC8X8Q7vV/O0l3G
         Z6kSQfj+bwrSd9gDnvGTu2FkqtNFM/AKycKz8EdP1s6K6YZjA9EDOUYTL090EYLi69Jx
         FPI6DZKF09Tmz0hCD4UJidqzxCTHlRf+WFpdOUsf3yKhZ6hLlPG8x7UCYJ8ts18QQbpn
         zECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jF4MxsPSKKSAh34A0y7fWqFeFSCCDQ9NCjS0um7aELU=;
        b=Bw38dXtsInY5gY/PpAPPybbaXvy+3XuiXuU4Q/Winhkhu5+GxVS5dPOzGi4pvg4ZtU
         mSbGVkyQhBha9Ooyqq/vwrid5SKi6VW7sD3j07r1dxgGQ5+Wd05x0TTcyv/vshFobKfk
         xtYfV37CK5mPfZE6JKIouUXw1ZJphj5xgHMwZoQfUfKz8v8/S+KnIDc/8fnt2CZyJGtN
         2QS2Jm5yluGRkai3QhUtaUzUZv9dfrbM48HVnvBEuAbiYI9+3juN7W6XmWQexMqaSr5X
         X10P0k2DBxUE6DcLQPLHACIP9HVNzvY52guNYxj7snd0Yo00tx/pr/FvD0dAsLLam9GF
         kmTw==
X-Gm-Message-State: AOAM533ho1F4YZW0xvfm10Uy8geVZD5CsRCkmi6xsUv06JDBlf/ETBEs
	IkLvHLYgdRUf0m4LB9oqV2l+f4Jc7bdVwqSLu0o=
X-Google-Smtp-Source: ABdhPJydmv+bbHARzEgvyIwdIWejEqbES0XbtJbkAtabvPybUWLA8/SV0kCjBlZCGBxZXSvZwXoaS3LA/pCN6q+ewUw=
X-Received: by 2002:a17:907:7242:b0:6f5:2904:5354 with SMTP id
 ds2-20020a170907724200b006f529045354mr32161701ejc.452.1653510911898; Wed, 25
 May 2022 13:35:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a26b:0:0:0:0:0 with HTTP; Wed, 25 May 2022 13:35:11
 -0700 (PDT)
From: Luisa Donstin <luisadonstin@gmail.com>
Date: Wed, 25 May 2022 22:35:11 +0200
Message-ID: <CA+QBM2rd1NojOmQ247cmwY+sk9R4hWU6pMA3fqAMrkMrBDEUUw@mail.gmail.com>
Subject: Bitte kontaktaufnahme Erforderlich !!! Please Contact Required !!!
To: contact@firstdiamondbk.com
Cc: info@firstdiamondbk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dGmozJXDO8I.A.E1.BbpjiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2101
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CA+QBM2rd1NojOmQ247cmwY+sk9R4hWU6pMA3fqAMrkMrBDEUUw@mail.gmail.com
Resent-Date: Wed, 25 May 2022 20:51:14 +0000 (UTC)

Guten Tag,

Ich habe mich nur gefragt, ob Sie meine vorherige E-Mail bekommen

haben ?

Ich habe versucht, Sie per E-Mail zu erreichen.

Kommen Sie bitte schnell zu mir zur=C3=BCck, es ist sehr wichtig.

Danke

Luisa Donstin

luisadonstin@gmail.com









----------------------------------




Good Afternoon,

I was just wondering if you got my Previous E-mail
have ?

I tried to reach you by E-mail.

Please come back to me quickly, it is very Important.

Thanks

Luisa Donstin

luisadonstin@gmail.com

