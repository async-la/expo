import * as React from 'react';
import { WebGLObject } from './GLView';
import { BaseGLViewProps, ComponentOrHandle, GLSnapshot, SnapshotOptions } from './GLView.types';
export interface GLViewProps extends BaseGLViewProps {
    onContextCreate: (gl: WebGLRenderingContext) => void;
    onContextRestored?: (gl?: WebGLRenderingContext) => void;
    onContextLost?: () => void;
    webglContextAttributes?: WebGLContextAttributes;
    /**
     * [iOS only] Number of samples for Apple's built-in multisampling.
     */
    msaaSamples: number;
    /**
     * A ref callback for the native GLView
     */
    nativeRef_EXPERIMENTAL?(callback: ComponentOrHandle | HTMLCanvasElement | null): any;
}
export declare class GLView extends React.Component<GLViewProps> {
    canvas?: HTMLCanvasElement;
    gl?: WebGLRenderingContext;
    static createContextAsync(): Promise<WebGLRenderingContext | null>;
    static destroyContextAsync(exgl?: WebGLRenderingContext | number): Promise<boolean>;
    static takeSnapshotAsync(gl: WebGLRenderingContext, options?: SnapshotOptions): Promise<GLSnapshot>;
    componentWillUnmount(): void;
    render(): JSX.Element;
    componentDidUpdate(prevProps: GLViewProps): void;
    private getGLContextOrReject;
    private onContextLost;
    private onContextRestored;
    private getGLContext;
    private setCanvasRef;
    takeSnapshotAsync(options?: SnapshotOptions): Promise<GLSnapshot>;
    startARSessionAsync(): Promise<void>;
    createCameraTextureAsync(): Promise<void>;
    destroyObjectAsync(glObject: WebGLObject): Promise<void>;
}
//# sourceMappingURL=GLView.web.d.ts.map